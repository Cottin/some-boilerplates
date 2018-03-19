import React from 'react'

import api from '../api'

const getName = async () => {
  const res = await fetch('http://www.mocky.io/v2/5a9fa7df2e0000520074d138')
  const json = await res.json()
  await sleep(1000)
  return json
}
const sleep = (ms) => {
  return new Promise(resolve => setTimeout(resolve, ms))
}

const Hello = ({name}) => (
  <h1>Hello {name}!</h1>
)

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {name: '...', countries: []};

    getName().then(({hello}) => this.setState({name: hello}))

    api.country.get().then((countries) => this.setState({countries}))
  }
  render() {
    return (
      <div>
        <Hello name={this.state.name} />
        {this.state.countries.map(this.renderCountry)}
      </div>
    )
  }

  renderCountry = (country) => (
    <div key={country}>{country}</div>
  )
}

export default App
