import React from 'react'
import axios from 'axios';
import IndividualFavRestaurant from './components/individualfavrestaurant';

export default class App2 extends React.Component{
    constructor(){
        super(),
        this.state ={
            checked: false
        }
    }
    componentDidMount(){
        if(this.props.present){
            this.setState({checked:true});
        }
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