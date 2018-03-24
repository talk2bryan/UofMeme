import React, { Component } from "react";
import { View, Text, StyleSheet, Button, Image, Modal, TouchableHighlight} from "react-native";

import { Icon } from "native-base";
import { ImagePicker } from "expo";
import t from 'tcomb-form-native';

const Form = t.form.Form;

const upload = t.struct({
    description: t.String
  });

var options = {
  auto: 'placeholders',
  fields:{
    description: {
      error: 'Must have a meme description'
    }
  }  
};

class UploadTab extends React.Component {
  static navigationOptions = {
    tabBarIcon: ({ tintColor }) => (
      <Icon name="ios-cloud-upload" style={{ color: tintColor }} />
    )
  };

  state = {
    image: null,
    modalVisible: false,
  };

  setModalVisible(visible) {
    this.setState({modalVisible: visible});
  }

  handleSubmit = () => {
    const value = this._form.getValue();    
    //console.log(this.props.navigator.navigate('HomeTab'));
    //console.log('value', value);
    //console.log(this.state.image);
  }

  render() {
    let { image } = this.state;
   
    return (
      <View style={styles.container}>
        <Button
          title="Pick an image from camera roll"
          onPress={this._pickImage}
        />
        <Modal animationType="slide" visible={this.state.modalVisible} onRequestClose={() => {alert('Modal has been closed.');}}>
          <View style={{marginTop: 22  }}>
            <View>
              <TouchableHighlight 
                onPress={() => {
                this.setModalVisible(!this.state.modalVisible);
              }}>
                <Icon name="ios-close-circle" style={{textAlign: 'right'}} />
              </TouchableHighlight> 
            </View>
            <View style={{alignItems: "center"}}>
              {image && (
                <Image source={{ uri: image }} style={styles.image} />
              )}
            </View>   
              <View style={{marginTop: 22 }}></View>
            <View>  
              <Form ref ={c => this._form = c} type={upload} options={options}/>
              <Button title='Post my meme!' onPress ={this.handleSubmit}/>
            </View>            
          </View>
        </Modal>        
      </View>      
    );
  }
     
  _pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      allowsEditing: true,
      aspect: [4, 3]
    });

    
    if (!result.cancelled) {
      this.setState({ image: result.uri });
      this.setState({modalVisible: true});
    }
  };
}


export default UploadTab;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  },
  image: {    
    width: 200, 
    height: 200      
  }
});
