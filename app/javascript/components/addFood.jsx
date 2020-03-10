import React from 'react'
import axios from 'axios';

export default class addFood extends React.Component{
    constructor(){
        super()
        this.state = {
            value: ""
        }
    }
    addItem=()=>{
        const url = `/favlist/foods/${this.state.value}`;
            axios.post(url)
          .then(res => {
             })
          .catch(err => {
            console.log(err.response);
          });
    }
    changeValue=(e)=>{
           this.setState({value: e.target.value});
    }
    render(){
        return(
            <div className="col-12">
                <div className="container">
                    <div className="row">
                    <div className="col-4">
                        <div className="form-inline">
                        <input value={this.state.value} className="form-control" onChange={(e)=>{this.changeValue(e)}}/>
                        <button onClick={this.addItem} className='btn btn-primary'>Add Food</button>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            );
    }
}