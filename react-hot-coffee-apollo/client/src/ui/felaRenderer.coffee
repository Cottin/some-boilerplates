fela = require 'fela'
prefixer = require('fela-plugin-prefixer').default
fallbackValue = require('fela-plugin-fallback-value').default

felaRenderer = fela.createRenderer {plugins: [prefixer(), fallbackValue()]}

felaRenderer.renderStatic """
html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Open Sans', sans-serif;
}

html {
  font-size: calc(9px + 0.3vw);
  height: 100%;
}

@media screen and (max-width: 400px) {
  html {
    font-size: 10px;
  }
}

@media screen and (min-width: 1000px) {
  html {
    font-size: 12px;
  }
}

* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

#app {
	display: flex;
	flex-grow: 1;
	height: 100%;
}

"""

module.exports = felaRenderer
