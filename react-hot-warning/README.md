For researching this bug: https://github.com/gaearon/react-hot-loader/issues/446


```
npm install
npm start
# open browser at localhost:8080
# open src/Hello.js and change something in render
# see the bundle.js:2075 Warning: setState(... in the browser console
```
