import React, { Component } from "react";
import {ListView, ActivityIndicator, View, Text, StyleSheet, Image} from "react-native";

import {
  Card,
  CardItem,
  Thumbnail,
  Body,
  Left,
  Right,
  Button,
  Icon
} from "native-base";

import { Constants, AppLoading } from "expo";


class CardComponent extends Component {
 constructor(props){
  super(props);
   this.state = {
     loaded: true,
     dataSource: [],
    }
 } 

  componentDidMount() {
   return fetch("http://uofmeme.solutions/api/v1/users")
      .then(response => response.json())
      .then(responseJson => {
        let ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
        this.setState(
          {
            loaded: false,
            dataSource: ds.cloneWithRows(responseJson.data)
          },         
        );
      })
      .catch(error => {
        console.error(error);
    });
  }
  
  render() {
   if (this.state.loaded) {
      return (
        <View style={{flex: 1, paddingTop: 20}}>
          <ActivityIndicator />
        </View>
      );
    }
   
    return (
     <View style={{flex: 1, paddingTop: 20}}>
        <ListView
 
         dataSource={this.state.dataSource}
 
         renderSeparator= {this.ListViewItemSeparator}
 
         renderRow={(rowData) =>
           
           <View style={{flex:1, flexDirection: 'row'}}>
             <Card>                  
                <CardItem>
                  <Left>                   
                   <Body>
                       <Text style={{fontSize: 20, fontWeight: 'bold'}}>{rowData.attributes.poster}</Text> 
                    </Body>
                  </Left>
                </CardItem>  
                <CardItem cardBody>                  
                  <Image
                    source={{uri: `data:image/jpeg;base64, ${rowData.attributes['uploaded-image-for-io-adapters']}`}}
                    style={{ height: 370, width: null, flex: 1 }}
                  />                  
                </CardItem>
                <CardItem>
                  <Left>
                    <Button transparent>
                       <Icon name="ios-thumbs-up-outline" style={{ color: "black" , paddingRight:5}} /> 
                       <Text>{rowData.attributes.like}</Text>                      
                    </Button>                    
                   <Button transparent>
                     <Icon name="ios-thumbs-down-outline" style={{ color: "black", paddingRight:5}} /> 
                     <Text>{rowData.attributes.dislike}</Text>                     
                   </Button>                              
                 </Left>
               </CardItem>
              <CardItem>
                <Body>
                  <Text style={{fontSize: 18}}>{rowData.attributes.description}</Text>
               </Body>
              </CardItem>   
             </Card>
            </View>
         }
       /> 
      </View>  
    );
  }
}


export default CardComponent;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  }
});
