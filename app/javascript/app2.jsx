import React from 'react'
import axios from 'axios';
import IndividualFavRestaurant from './components/individualfavrestaurant';

export default class App2 extends React.Component{
    constructor(){
        super(),
        this.state ={
            checked: false,
            foodChecked: []
        }
    }
    componentDidMount(){
        if(this.props.present){
            this.setState({checked:true});
        }
        let foodNum = parseInt(this.props.food.length);
        const foodList = this.props.food;
        const favouritedFood = this.props.checkedFood;
        const foodChecked = [];
        for(var i = 0; i < foodNum; i++){
          const found = favouritedFood.filter(food => food.id === foodList[i])
          console.log(found.length > 0);
          if(found){
            foodChecked.push(true);
          }else{
            foodChecked.push(false);
          }
        }
        this.setState({foodChecked: foodChecked})
    }


    handleFav = lists => {
        if(this.state.checked){
        console.log("Destroying");
        const url = `/favlist/restaurants/${lists.target.value}`;
            axios.delete(url)
          .then(res => {
            this.setState({checked:false})
            console.log('State', this.state.checked)
             })
          .catch(err => {
            console.log(err.response);
          });
        }else{
            console.log("Creating");
          const url = `/favlist/restaurants/${lists.target.value}`;
            axios.post(url)
          .then(res => {
            this.setState({checked:true});
                    console.log('State', this.state.checked);
             })
          .catch(err => {
            console.log(err.response);
          });
        }}
    handleFoodFav = lists => {
            const url = `/favlist/foods/${lists.target.value}`;
            const checkedFood = this.state.foodChecked;
            console.log('target', lists.target.id)
        if(this.state.foodChecked[lists.target.index]){
        console.log("Remove Favorited food");
            axios.delete(url)
          .then(res => {
            checkedFood[lists.target.id] = false;
            this.setState({foodChecked: checkedFood})
            console.log('State', this.state.checked)
             })
          .catch(err => {
            console.log(err.response);
          });
        }else{
            console.log("Favorite food");
            axios.post(url)
          .then(res => {
            checkedFood[lists.target.id] = true;
            this.setState({foodChecked: checkedFood});
                    console.log('State', this.state.checked);
             })
          .catch(err => {
            console.log(err.response);
          });
        }}

    render(){
        let displayRestaurant = "";
        let foods="";
     if(this.props.data){
        const checked = this.state.foodChecked;
        foods = this.props.food.map((food,index) =>{
            return <div className="input-group">
             <input id={index}
                    value={food.id}
                   type="checkbox"
                   checked={checked[index]}
                   className = "foodcheckbox"
                   onChange ={(e)=>{this.handleFoodFav(e)}}
                   />
            {food.name}
            <label htmlFor={index} className="ml-3 mr-2"/>
            </div>
        });
        displayRestaurant = <div className='col mx-auto text-center'>
        <div className='d-flex d-inline'><h1>{this.props.data.name}</h1>
            <input id="heart"
                   value={this.props.data.id}
                   type="checkbox"
                   className = "red-heart-checkbox"
                   checked={this.state.checked}
                   onChange = {(e)=>{this.handleFav(e)}}
                   />
            <label htmlFor="heart"></label>
        </div>
        <div>
        <img src={this.props.data.image_url} />
        <h5>Menu items</h5>
        </div>
        <div className="w-50 mx-auto text-center form-inline">
        {foods}
        </div>

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