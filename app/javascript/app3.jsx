import React from 'react'
import axios from 'axios';
import Favfood from './components/favfood'
export default class App3 extends React.Component{

    render(){
        return(
            <div className="container">
                <div className="row">
                    <Favfood data={this.props.data} fav={this.props.fav}/>
                </div>
            </div>
            );
    }
}