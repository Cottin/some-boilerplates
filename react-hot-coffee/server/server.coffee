require('dotenv').config()

express = require 'express'
bodyParser = require 'body-parser'
cors = require 'cors'
PromiseRouter = require 'express-promise-router'
morgan = require 'morgan'

countries = require './countries'

app = express()

app.use morgan('combined')
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()


app.use cors()

getCountries = () ->
	# let's fake a delay!
	return new Promise (res) ->
		setTimeout res.bind(null, countries), 1000

router = new PromiseRouter()
app.use '/api', router

router.get '/country', (req, res) ->
	countries = await getCountries()
	res.send countries

app.listen process.env.PORT, () ->
	console.log 'Listening on ' + process.env.PORT
