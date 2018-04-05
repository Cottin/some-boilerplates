import React from 'react'


class Hello extends React.Component {
  constructor(props) {
    super(props)
    this.state = {name: '...'};

    this.getNameAndSet = this.getNameAndSet.bind(this)

    this.getNameAndSet()
  }
  getNameAndSet() {
    console.log(this)
    setTimeout((() => this.setState({name: 'Worrrld'})), 100)
  }
  render() {
    return (
		  <div>
        Hello {this.state.name}!!!
		    <br /><br /><br />
		  </div>
		)
	}
}

export default Hello
