import React from 'react'
import axios from 'axios';

export default class Favrestaurant extends React.Component{
    render(){
        const favRestaurant = this.props.favRestaurant.map((restaurant, index)=>{
            let link = '/favlist/restaurants' + restaurant.id;
          return (
            <React.Fragment key = {index}>
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