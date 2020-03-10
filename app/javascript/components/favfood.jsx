import React from 'react'
import axios from 'axios';

export default class Favrestaurant extends React.Component{
    constructor(){
        super(),
        this.state = {
            restaurants: []
        }
    }
    componentDidMount(){
        this.setState({ restaurants: this.props.data});
    }
    render(){
        const favRestaurant = this.state.restaurants.map((restaurant, index)=>{
            let link = '/favlist/restaurants/' + restaurant.id;
            const favNumber = this.props.fav;
          return (
            <React.Fragment key = {index}>
                        <div className="col-4 p-0 mb-3">
                        <a href={link}>
                        <img className ="thumb-img" width="300px" height="300px" src={restaurant.image_url} />
                        <h4>{restaurant.name}</h4>
                        <div>
                        <p className="text-muted">Number of favorite menu item: {favNumber[index]}</p>
                        </div>
                        </a>
                         </div>
            </React.Fragment>);
        });
        return(
            <div className="col-12">
                <div className="container">
                    <div className="row">
                        {favRestaurant}
                    </div>
                </div>
            </div>
            );
    }
}