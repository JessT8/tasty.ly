// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import App from '../app'
import App2 from '../app2'

const Hello = props => (
    <div></div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
if( document.getElementById('list')){
    const node = document.getElementById('list');
    const data = JSON.parse(node.getAttribute('data'));
  ReactDOM.render(
    <App data={data}/>,
   document.getElementById('list')
  )}else if(document.getElementById('individualRestaurant')){
      const node = document.getElementById('individualRestaurant');
      const data = JSON.parse(node.getAttribute('data'));
      const food = JSON.parse(node.getAttribute('food'));
      const present = node.getAttribute('present');
      let checked = false;
      if(present){
        checked= true;
      }
      console.log(checked);
      ReactDOM.render(
    <App2 data={data} food={food} present={checked}/>, node)
  }})