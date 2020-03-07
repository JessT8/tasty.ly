import React from 'react'
import axios from 'axios';

export default class Favrestaurant extends React.Component{
    render(){
        const favRestaurant = this.props.favRestaurant.map((restaurant, index)=>{
          return (
            <React.Fragment key = {index}>
                        <div className="col-4 p-0 mb-3">
                        <img src={restaurant.image_url} />
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