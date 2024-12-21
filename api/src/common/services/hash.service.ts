import * as bcrypt from 'bcrypt';

export class HashService {
  static async make(data: string): Promise<string> {
    return bcrypt.hash(data, 10);
  }

  static compare(data: string, hash: string): Promise<boolean> {
    return bcrypt.compare(data, hash);
  }
}
