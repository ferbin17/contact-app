const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/jquery-3.2.1.min',
    jQuery: 'jquery/jquery-3.2.1.min'
  })
)

module.exports = environment
