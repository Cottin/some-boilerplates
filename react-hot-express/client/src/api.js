const _get = (url) => {
	return fetch(CONFIG_API_URL + url, {credentials: 'include'})
						.then((res) => res.json())
}

export default {
	country: {
		get: () => {
			return _get('/country')
		}
	}
}
