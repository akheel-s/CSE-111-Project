module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'dec1afdc1751b1402ba2d141a5e37589'),
  },
});
