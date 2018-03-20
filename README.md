# some-boilerplates
A collection of some boilerplates I use


## Current state
Feels hard to keep up with latest things. Just thought I'd keep an index of technologies and comments about them so I don't do the same research twice.

### Client side

* **React**: **v16.2.0**. From 16.0 you get fragments and portals. Async rendering cool but probably not game-changer for my projects.

* **react-hot-loader**: **v4** Has been a bit messy with versions, but v4 seems good. The old goto boilerplate [react-hot-boilerplate](https://github.com/gaearon/react-hot-boilerplate) seems deserted, see others.

* **babel**: Seems many still use es2015 + stage-2 since they have problems with env. For me env + stage-2 has worked.

* **webpack**: **v4** Make sure to update to 4 because it feels faster

* **webpack-dev-server** vs **express+webpack-dev-middleware**: I've always prefered having a `server.js` handling things (see react-hot-express) but having some reload problems when things get more complex so should look into using webpack-dev-server, but last time proxy didn't work and many others reported the same.

* **svg**: For icons etc. I like to prepackage using webpack and [svg-react-loader](https://github.com/jhamlet/svg-react-loader) is the nicest way I've found

* **coffeescript**: **v2** TODO: have not tried version 2 client side yet


### Server side

* **node**: **v8 or v9** supports the new stuff. Use babel-node.

* **nodemon**: Using lastest. TODO: best way of debugging?

* **express**: **v4** don't know difference but using latest. Also express-promise-router + async / await is nice when doing REST

* **coffeescript**: **v2** when using coffee, no need for babel as long as node is resent.
