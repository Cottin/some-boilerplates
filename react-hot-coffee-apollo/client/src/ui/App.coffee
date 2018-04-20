React = require 'react'
{ hot } = require 'react-hot-loader'
{ Provider: FelaProvider } = require 'react-fela'
ApolloClient = require("apollo-boost").default
{ ApolloProvider } = require "react-apollo"

felaRenderer = require './felaRenderer'
Body = require './Body'

apolloClient = new ApolloClient({uri: CONFIG_API_URL})

App = ->
	React.createElement ApolloProvider, {client: apolloClient},
		React.createElement FelaProvider, {renderer: felaRenderer},
			React.createElement Body

module.exports = hot(module)(App)
