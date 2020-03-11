import React from 'react'
import axios from 'axios';
import AddFood from './components/addFood'

export default class App4 extends React.Component{
    constructor(){
        super()
        this.state ={
            foods: [],
            food_likes: []
        }
    }
    componentDidMount(){
        const foods = this.props.foods;
        const likes = this.props.food_likes;
        this.setState({foods: foods, food_likes: likes});
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

            this.setState({"foods": [...this.state.foods, food], food_likes: [...this.state.food_likes, 0]})
                console.log(res);
             })
          .catch(err => {
            console.log(err.response);
          });
    }
    render(){
        let foods = this.state.foods.map((food, index)=>{
             let likes = this.state.food_likes;
            return (<div className="container">
                        <div className="row border border-primary border-top-0 border-left-0 border-right-0 mb-2 mt-2 pb-2">
                            <div className="col-10">
                                {food.name}
                            </div>
                            <div className="col-2 my-auto ">
                               <p> <i>{likes[index]}</i> ❤️</p>
                            </div>
                        </div>
                    </div>)
        });
        return(
            <div className="container">
            <div className="row mt-3 ml-2 ">
             <div className="col mx-auto justify-content-center">
            <p>{this.props.restaurant_likes} ❤️</p>
            </div>
            </div>
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