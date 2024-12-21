export interface AuthConfig {
  auth: {
    jwtAccessTokenSecret: string;
    jwtAccessTokenExpiresIn: string;
    jwtRefreshTokenSecret: string;
    jwtRefreshTokenExpiresIn: string;
    googleClientId: string;
    googleClientSecret: string;
  };
}

export default (): AuthConfig => ({
  auth: {
    jwtAccessTokenSecret: process.env.JWT_ACCESS_TOKEN_SECRET || 'secretKey',
    jwtAccessTokenExpiresIn: process.env.JWT_ACCESS_TOKEN_EXPIRES_IN || '15m',
    jwtRefreshTokenSecret: process.env.JWT_REFRESH_TOKEN_SECRET || 'secretKey',
    jwtRefreshTokenExpiresIn: process.env.JWT_REFRESH_TOKEN_EXPIRES_IN || '30d',
    googleClientId: process.env.GOOGLE_CLIENT_ID || 'your_client_id',
    googleClientSecret:
      process.env.GOOGLE_CLIENT_SECRET || 'your_client_secret',
  },
});
