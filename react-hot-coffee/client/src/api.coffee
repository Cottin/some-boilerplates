_get = (url) ->
	fetch(CONFIG_API_URL + url, {credentials: 'include'})
		.then (res) -> res.json()

module.exports =
	country:
		get: () -> _get '/country'
