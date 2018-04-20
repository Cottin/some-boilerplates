require('dotenv').config()

express = require 'express'
bodyParser = require 'body-parser'
cors = require 'cors'
morgan = require 'morgan'
{graphqlExpress, graphiqlExpress} = require 'apollo-server-express'
{makeExecutableSchema} = require 'graphql-tools'

typeDefs = require './typeDefs'
resolvers = require './resolvers'
countries = require './countries'

app = express()

app.use morgan('combined')
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()

app.use cors()

schema = makeExecutableSchema {typeDefs, resolvers}

app.use '/graphql', bodyParser.json(),
	graphqlExpress (req) -> {schema, context: {me: req.user}}

app.use '/graphiql', graphiqlExpress {endpointURL: '/graphql'}

app.listen process.env.PORT, () ->
	console.log 'Listening on ' + process.env.PORT
