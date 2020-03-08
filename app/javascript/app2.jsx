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
 //    const url = `/favlist/restaurants/${lists.target.value}`;
 //        axios.delete(url, {
 // data: { }})
 //      .then(res => {
        let checked = this.state.checked;
        this.setState({checked: !checked});
      //   })
      // .catch(err => {
      //   console.log(err.response);
      // });
  };
    render(){
        let displayRestaurant = "";
        let foods="";
     if(this.props.data){
        foods = this.props.food.map((food,index) =>{
            return <div className="input-group">
             <input id={index}
                   type="checkbox"
                   className = "foodcheckbox"
                   />
            {food.name}
            <label htmlFor={index} className="ml-3 mr-2"/>
            </div>
        });
        displayRestaurant = <div className='col mx-auto text-center'>
        <div className='d-flex d-inline'><h1>{this.props.data.name}</h1>
            <input id="heart"
                   type="checkbox"
                   className = "red-heart-checkbox"
                   checked={this.state.checked}
                   onChange = {(e)=>{this.handleRemove(e)}}
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