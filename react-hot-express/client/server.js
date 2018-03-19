require('dotenv').config()

const http = require('http')
const express = require('express')
const app = express()

const webpackConfig = require('./webpack.config.dev');

app.use(require('morgan')('short'))

var httpProxy = require('http-proxy');
var apiProxy = httpProxy.createProxyServer();

apiProxy.on('error', function (err, req, res) {
  res.writeHead(500, {
    'Content-Type': 'text/plain'
  });

  var msg = 'proxy error in server.js. Probably backend is not deployed yet?'
  console.log('###############################################################')
  console.log(msg)
  res.end(msg);
});


app.all("/api/*", function(req, res) {
  apiProxy.web(req, res, {target: process.env.SERVER});
});



// -----------------------------------------------------------------------------
// Step 1: Create & configure a webpack compiler
const webpack = require('webpack')
const compiler = webpack(webpackConfig)

// Step 2: Attach the dev middleware to the compiler & the server
app.use(require("webpack-dev-middleware")(compiler, {
  logLevel: 'warn',
  publicPath: webpackConfig.output.publicPath,
  stats: {colors: true},
}))

// Step 3: Attach the hot middleware to the compiler & the server
app.use(require("webpack-hot-middleware")(compiler, {
  log: console.log, path: '/__webpack_hmr', heartbeat: 10 * 1000
}))
// -----------------------------------------------------------------------------


app.get("/", function(req, res) {
  res.sendFile(__dirname + '/index.html')
})

if (require.main === module) {
  const server = http.createServer(app)
  server.listen(process.env.PORT, (err) => {
    if (err) { return console.error(err) }
    console.log("Listening on %j", server.address())
  })
}
