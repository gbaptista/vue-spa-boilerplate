const VueLoaderPlugin = require('vue-loader/lib/plugin')

const path = require('path');

module.exports = env => {
  return {
    entry: {
      app: './javascripts/app.js'
    },
    output: {
      path: path.resolve(__dirname, 'public/assets/javascripts'),
      filename: "[name].js"
    },
    mode: env.NODE_ENV,
    devtool: env.DEV_TOOL,
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /(node_modules)/,
          include: path.resolve(__dirname, 'javascripts'),
          use: {
            loader: 'babel-loader',
            options: {
              cacheDirectory: true
            }
          }
        },
        {
          test: /\.vue$/,
          exclude: /(node_modules)/,
          include: [
            path.resolve(__dirname, 'javascripts/pages')
          ],
          loader: 'vue-loader'
        },
        {
          test: /\.css$/,
          include: [
            path.resolve(__dirname, 'javascripts/pages')
          ],
          use: [
            'vue-style-loader',
            'css-loader'
          ]
        }
      ]
    },
    resolve: {
      alias: {
        'vue$': 'vue/dist/vue.common.js'
      }
    },
    plugins: [
      new VueLoaderPlugin()
    ],
    externals: { moment: 'moment' }
  }
};
