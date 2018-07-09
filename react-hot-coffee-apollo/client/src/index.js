import React from 'react'
import { render } from 'react-dom'
import App from './ui/App'

const root = document.createElement('div')
root.setAttribute('id', 'app')
document.body.appendChild(root)

render(<App />, root)
