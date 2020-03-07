import React from 'react'
import axios from 'axios';
import IndividualFavRestaurant from './components/individualfavrestaurant';

export default class App2 extends React.Component{

    render(){
        let displayRestaurant = "";
        console.log(this.props.restaurant)
     if(this.props.restaurant){
        displayRestaurant = <div>
        <h1>{this.props.restaurant.name}</h1>
        <img src={this.props.restaurant.image_url} />
        </div>
     }
        return(
            <div className="container">
                <div className="row">
                    {displayRestaurant}
                </div>
            </div>
            );
    }
}