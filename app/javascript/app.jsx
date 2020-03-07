import React from 'react'
import axios from 'axios';
import FavRestaurant from './components/favrestaurant';

export default class App extends React.Component{
    constructor(){
        super(),
        this.state = {
            restaurants: [],
            search: ""
        }
    }
    componentDidMount(){
        this.getRestaurants();
    }

    changeInput = (currentInput) => {
        this.setState({ search: currentInput });
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
              this.setState({ restaurants: restaurants });
            }).catch((error)=>{
              console.log(error);
            })
    }

    render(){
        return(
            <div className="container">
                <div className="row">
                    <FavRestaurant favRestaurant={this.state.restaurants}/>
                </div>
            </div>
            );
    }
}