export interface TypeOrmConfig {
  typeOrm: {
    synchronize: boolean;
  };
}

export default (): TypeOrmConfig => ({
  typeOrm: {
    synchronize: process.env.NODE_ENV === 'development',
  },
});
