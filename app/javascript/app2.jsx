import React from 'react'
import axios from 'axios';
import IndividualFavRestaurant from './components/individualfavrestaurant';

export default class App2 extends React.Component{
    constructor(){
        super()
        this.state = {
            checked: true
        }
    }

handleRemove = lists => {
    const url = `/favlist/restaurants/${lists.target.value}`;
        axios.delete(url, {
 data: { }})
      .then(res => {
        this.setState({checked: !checked});
        })
      .catch(err => {
        console.log(err.response);
      });
  };
    render(){
        let displayRestaurant = "";
        let foods="";
     if(this.props.data){
        foods = this.props.food.map((food,index) =>{
            return <div className="input-group">
            <label htmlFor={index}>{food.name}</label><input
            value={food.id}
            type="checkbox"
            name={food.name}
            id= {index}
            className="mr-3 ml-3 mt-1"
            />
            </div>
        });
        displayRestaurant = <div className='col mx-auto text-center'>
        <div className='d-flex d-inline'><h1>{this.props.data.name}</h1>
            <input
            value={this.props.data.id}
            type="checkbox"
            className="mt-3 ml-3"
            checked = {this.state.checked}
            onChange = {(event)=>{this.handleRemove(event);}}
            /></div>

        <img src={this.props.data.image_url} />
        <h5>Menu items</h5>
        <div className="w-50 mx-auto text-center form-inline">
        {foods}</div>
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