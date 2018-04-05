import React from 'react'
import { hot } from 'react-hot-loader'
import Counter from './Counter'
import Hello from './Hello'

const App = () => (
  <div>
    Hello, world<br />
    <Hello />

    <Counter />
  </div>
)

export default hot(module)(App)
