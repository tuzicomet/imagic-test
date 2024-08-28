const path = require('path');

module.exports = {
  entry: ['./web/tailwind-input.css', './web/imageSwiper.js'],
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'web/dist'),
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader', 'postcss-loader'],
      },
      {
        test: /\.js$/,
        exclude: /node_modules/
      },
    ],
  },
  devServer: {
    contentBase: path.resolve(__dirname, 'web/dist'),
    compress: true,
    port: 9000,
  },
};
