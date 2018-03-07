import React from 'react'

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
    this.state = {name: '...'};

    getName().then(({hello}) => this.setState({name: hello}))
  }
  render() {
    return <Hello name={this.state.name} />
  }
}

export default App
