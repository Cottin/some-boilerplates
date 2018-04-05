require('dotenv').config()

import express from 'express'
import bodyParser from 'body-parser'
import cors from 'cors'
import PromiseRouter from 'express-promise-router'
import morgan from 'morgan'

import countries from './countries'

const app = express()

app.use(morgan('combined'))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())


app.use(cors())

const getCountries = () => {
	// let's fake a delay!
	return new Promise((res) => {
		setTimeout(res.bind(null, countries), 1000)
	})
}

const router = new PromiseRouter()
app.use('/api', router)

router.get('/country', async (req, res) => {
	const countries = await getCountries()
	res.send(countries)
})

app.listen(process.env.PORT, () => {
	console.log('Listening on ' + process.env.PORT)
})
