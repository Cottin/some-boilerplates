React = require 'react'
{ hot } = require 'react-hot-loader'
{ Provider: FelaProvider } = require 'react-fela'
ApolloClient = require("apollo-boost").default
{ ApolloProvider } = require "react-apollo"
{ createRouter, RouterProvider } = require 'react-functional-router'

felaRenderer = require './felaRenderer'
Body = require './Body'

apolloClient = new ApolloClient({uri: CONFIG_API_URL})

router = createRouter()

App = ->
	React.createElement ApolloProvider, {client: apolloClient},
		React.createElement RouterProvider, {router},
			React.createElement FelaProvider, {renderer: felaRenderer},
				React.createElement Body

module.exports = hot(module)(App)
