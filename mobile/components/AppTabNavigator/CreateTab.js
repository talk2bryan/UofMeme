import React, { Component } from "react";
import { View, Text, StyleSheet, Image, TouchableOpacity, StatusBar, ScrollView, Dimensions, Modal, Alert, TouchableHighlight } from "react-native";

import { Icon } from "native-base";


StatusBar.setBarStyle('light-content');
console.disableYellowBox = true;

const placeholder = require('../../assets/icon.png');

const windowDims = Dimensions.get('window'),
      itemSize   = (windowDims.width / 2) - 20; 

class CreateTab extends Component {
 
  static navigationOptions = {
    tabBarIcon: ({ tintColor }) => (
      <Icon name="ios-add-circle" style={{ color: tintColor }} />
    )
  };

  state = {
    modalVisible: false,
    data : [] // empty data array
  };

  setModalVisible(visible) {
    this.setState({modalVisible: visible});
  }

  onAfterLoad = (data) => {
      this.setState({
          data : data.data
      });
  };


  componentWillMount() {
        // The URL below has an 'r' parameter that is used as a 'cache buster' and is only intended for demonstration purposes
      let url = 'http://api.giphy.com/v1/gifs/search?q=javascript&api_key=dc6zaTOxFJmzC&limit=30&r=' + Math.random();
      console.log('Loading data')

        // Initiate query, parse, then update view via callback
      fetch(url)
          .then(function(r) {
              return r.json();
          })
          .then(this.onAfterLoad) // Success callback registration
          .catch(function(e) {    // Failure callback registartion
              alert('Failure fetching data');
              console.log(e)
          });
  }  

  buildImages(data){
    let images = [],
        length = data.length,
        i      = 0,
        randVal = '?r=' + Math.random(),  // Cache busting for testing only can be removed
        source,
        item;

    if (data.length == 0) {
            // This console.log() call can be removed.
          console.log('Rendering placeholders');
            // Fill the array with 10 undefines
          data.length = length = 10;
    }
    else {
            // This else branch is here just for debugging and can be removed.
         console.log(`Got data. Rendering ${length} images.`);
    } 
      

    for (; i < length; i++) {
          item = data[i];

            // For when we actually have data
          if (item) {
            source = {
                uri    : item.images.original_still.url + randVal, 
                width  : itemSize, 
                height : itemSize
            }
            
          }

          
          images.push(
            <TouchableOpacity onPress= {() => {this.setModalVisible(!this.state.modalVisible);}}>
              <Image style={styles.child} 
                      source={source} 
                      key={'img' + i}/>
            </TouchableOpacity>          
            
          )

    }
    return images;
  }  

  render() {
    let state  = this.state,
        data   = state.data,
        images = this.buildImages(data);

       
    return (
      
      <View style={{flex:1}}>                
        <ScrollView contentContainerStyle={styles.container}>
            {images}                             
        </ScrollView>  
        <Modal animationType="slide" visible={this.state.modalVisible}>
          <View style={{marginTop: 22}}> 

            <TouchableHighlight
                onPress={() => {
                  this.setModalVisible(!this.state.modalVisible);
                }}>
                <Icon name="ios-close-circle" style={{textAlign: 'right'}}/>
              </TouchableHighlight>     
            
          </View>
        </Modal>                                   
      </View>        
    );  
  }
}


export default CreateTab;

const styles = StyleSheet.create({
  container : {
        paddingTop      :  20,
        justifyContent  : 'center',
        alignItems      : 'center',
        backgroundColor : 'white',
        flexDirection   : 'row',
        flexWrap        : 'wrap'
  },

  child : {
        width  : itemSize,
        height : itemSize,
        margin : 7
  }  
});


