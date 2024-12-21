import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';

import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';

import typeormConfig, { TypeOrmConfig } from './config/typeorm.config';
import databaseConfig, { DatabaseConfig } from './config/database.config';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      load: [typeormConfig, databaseConfig],
    }),
    TypeOrmModule.forRootAsync({
      useFactory: (
        configService: ConfigService<TypeOrmConfig & DatabaseConfig>,
      ) => ({
        type: 'mysql',
        host: configService.get('database.host', { infer: true }),
        port: configService.get('database.port', { infer: true }),
        username: configService.get('database.username', { infer: true }),
        password: configService.get('database.password', { infer: true }),
        database: configService.get('database.name', { infer: true }),
        entities: [__dirname + '/**/*.entity.{ts,js}'],
        synchronize: configService.get('typeOrm.synchronize', {
          infer: true,
        }),
      }),
      inject: [ConfigService],
    }),
    AuthModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
