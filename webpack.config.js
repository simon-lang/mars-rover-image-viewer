module.exports = {
  entry: ['./src/entry.coffee'],
  output: {
    path: __dirname,
    filename: './build/bundle.js'
  },
  module: {
    loaders: [
      {
        test: /\.coffee$/,
        loader: 'coffee'
      },
      {
        test: /\.pug$/,
        loader: 'pug-html-loader'
      },
      {
        test: /\.less$/,
        loader: 'style!css!less'
      },
      {
        test: /\.css$/,
        loader: 'style!css'
      },
      {
        test: /\.html$/,
        loader: 'ng-cache?prefix=[dir]/[dir]'
      },
      {
        test: require.resolve('jquery'),
        loader: 'expose?$!expose?jQuery'
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=10000&minetype=application/font-woff'
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader'
      },
    ]
  }
}
