# react-hot-express

Client served using separate express server with webpack-hot-middleware. Good if you want more control over how the client development environment is served.
Based on https://github.com/glenjamin/webpack-hot-middleware/tree/master/example

```sh
npm install
npm start
```

# Client
* Using server.js with express and webpack-hot-middleware + http-proxy for calls to /api
* webpack 4
* react-hot-loader 4
* babel-preset-env, babel-polyfill = Promise, async/await etc.

# Server - TODO
* Node with express 4
* express-promise-router and async/await in rest endpoints

