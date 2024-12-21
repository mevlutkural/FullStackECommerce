import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { HashService } from 'src/common/services/hash.service';
import { AuthConfig } from 'src/config/auth.config';
import { User } from 'src/users/entities/user.entity';
import { UserService } from 'src/users/user.service';
import { RegisterDto } from './dto/register.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService<AuthConfig>,
  ) {}
  async validateUser(email: string, password: string): Promise<User> {
    const user = await this.userService.findByEmail(email);
    if (!user) throw new NotFoundException('User not found');
    const passwordValid = await HashService.compare(password, user.password);
    if (!passwordValid)
      throw new UnauthorizedException('Password is not valid');
    return user;
  }

  async login(user: User) {
    const payload = { sub: user.id, email: user.email };
    return {
      access_token: this.jwtService.sign(payload, {
        secret: this.configService.get('auth.jwtAccessTokenSecret', {
          infer: true,
        }),
        expiresIn: this.configService.get('auth.jwtAccessTokenExpiresIn', {
          infer: true,
        }),
      }),
      user: {
        id: user.id,
        email: user.email,
        fullName: user.fullName,
      },
    };
  }

  async register(registerDto: RegisterDto) {
    const { email, password, confirmPassword } = registerDto;
    if (password !== confirmPassword)
      throw new UnauthorizedException('Passwords do not match');
    const existingUser = await this.userService.findByEmail(email);
    if (existingUser) throw new UnauthorizedException('Email already in use');
    const hashedPassword = await HashService.make(password);
    const user = await this.userService.create({
      email,
      password: hashedPassword,
      fullName: registerDto.fullName,
    });
    return this.login(user);
  }
}
