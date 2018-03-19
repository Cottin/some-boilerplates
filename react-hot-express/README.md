# react-hot-express

Client served using separate express server with webpack-hot-middleware. Good if you want more control over how the client development environment is served.
Based on https://github.com/glenjamin/webpack-hot-middleware/tree/master/example

```sh
cd client
npm install
npm start

# in new shell:
cd server
npm install
npm start

# go to localhost:8810 in a web browser
```

# Client
* Using server.js with express and webpack-hot-middleware + http-proxy for calls to /api
* webpack 4
* react-hot-loader 4
* babel-preset-env, babel-polyfill = Promise, async/await etc.

# Server
* Node babel-node and nodemon
* express 4
* express-promise-router and async/await in rest endpoints

