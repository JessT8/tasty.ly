import React from 'react'
import axios from 'axios';
import AddFood from './components/addFood'
export default class App4 extends React.Component{
    constructor(){
        super()
        this.state ={
            foods: []
        }
    }
    componentDidMount(){
        const foods = this.props.foods;
        this.setState({foods: foods});
    }
    updateFood = value =>{
        console.log('here');
        const url = `/foods`;
        console.log(this.props.restaurant.id)
             const food = {
                   name: value,
                   restaurant_id: this.props.restaurant.id
                }
            axios.post(url, food)
          .then(res => {

            this.setState({"foods": [...this.state.foods, food]})
                console.log(res);
             })
          .catch(err => {
            console.log(err.response);
          });
    }
    render(){
        let foods = this.state.foods.map(food=>{
            return <div><li className="
            pb-2">{food.name}</li></div>
        });
        return(
            <div className="container">
               <AddFood restaurant={this.props.restaurant} updateFood={this.updateFood}/>
               <div className="row">
               <div className="w-75 foodHeight text-left mx-auto">
               <ol>
                    {foods}
                    </ol>
                    </div>

            </div>
            </div>
            );
    }
}