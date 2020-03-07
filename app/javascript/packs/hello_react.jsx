// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import App from '../app'
import App2 from '../app2'

const Hello = props => (
    <div><App/></div>
)
const IndividualFavRestaurant = props => (
    <div><App2/></div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
if( document.getElementById('list')){
  ReactDOM.render(
    <Hello name="React" />,
   document.getElementById('list')
  )
}else if( document.getElementById('IndividualFavRestaurant')){
      ReactDOM.render(
    <Hello name="React" />,
   document.getElementById('IndividualFavRestaurant')
  )
}
})