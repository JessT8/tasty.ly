import React from 'react'
import axios from 'axios';
import IndividualFavRestaurant from './components/individualfavrestaurant';

export default class App extends React.Component{
    constructor(){
        super(),
        this.state = {
            restaurant: null,
            menu: null
        }
    }
    componentDidMount(){
        this.getRestaurants();
    }


    getRestaurants = () => {
          const url = '/restaurants.json';
          axios.get(url)
            .then((response) => {
              const data = response.data;
              let restaurants = data.filter((restaurant) => {
                return (restaurant.name.toLowerCase()).includes((this.state.search).toString().toLowerCase()) ;
            });
              this.setState({ restaurant: restaurants });
            }).catch((error)=>{
              console.log(error);
            })
    }

    render(){
        let displayRestaurant = <div>
            {this.state.restaurant.image_url}
            {this.state.restaurant.name}
        </div>
        return(
            <div className="container">
                <div className="row">
                    {displayRestaurant}
                </div>
            </div>
            );
    }
}