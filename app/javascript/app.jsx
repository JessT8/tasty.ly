import React from 'react'
import axios from 'axios';
import Favrestaurant from './components/favrestaurant'
export default class App extends React.Component{

    render(){
        return(
            <div className="container">
                <div className="row">
                    <Favrestaurant data={this.props.data}/>
                </div>
            </div>
            );
    }
}