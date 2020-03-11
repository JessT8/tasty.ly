import React from 'react'
import axios from 'axios';

export default class addFood extends React.Component{
    constructor(){
        super()
        this.state = {
            value: "",
            errMsg: ""
        }
    }
    updateFood=()=>{
        console.log(this.state.value!=="");
        if(this.state.value!== ""){
            this.props.updateFood(this.state.value);
            this.setState({value:"",errMsg:""});
        }else{
            this.setState({errMsg:"Please input something"});
        }
    }
    changeValue=(e)=>{
           this.setState({value: e.target.value});
    }
    render(){
        return(
                    <div className="row mt-2 mb-5">
                    <div className="col mx-auto justify-content-center">
                        <div className="form-inline justify-content-center">
                        <input value={this.state.value} className="form-control mr-2" onChange={(e)=>{this.changeValue(e)}}/>
                        <button onClick={this.updateFood} className='btn btn-primary'>Add Food</button><p style={{color:"red"}}>{this.state.errMsg}</p>
                        </div>
                    </div>
                    </div>
            );
    }
}