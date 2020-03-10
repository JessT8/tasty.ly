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
    updateFood = food =>{
        const foods = [...this.props.foods, food];
        this.setState({foods: foods});
    }
    render(){
        let foods = this.state.foods.map(food=>{
            return <div>{food.name}</div>
        });
        return(
            <div className="container">
                    {foods}
                    <AddFood updateFood={this.updateFood}/>
            </div>
            );
    }
}