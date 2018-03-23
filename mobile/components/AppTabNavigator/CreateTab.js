import React, { Component } from "react";
import { AppRegistry, ImageBackground, StyleSheet, ActivityIndicator, ListView, TextInput, View, Alert,Image, Platform, TouchableHighlight, Modal,
         TouchableOpacity, Button } from 'react-native';
import { Icon } from "native-base";
 
class CreateTab1 extends Component {
 
 constructor(props) {
   super(props);
   this.state = {
     modalVisible: false,
     isLoading: true,
     dataSource: [],
     url: '',
     text: 'Add text here'
   }
 }

  static navigationOptions = {
    tabBarIcon: ({ tintColor }) => (
      <Icon name="ios-add-circle" style={{ color: tintColor }} />
    )
  };

  setModalVisible(visible) {
    this.setState({modalVisible: visible});
    this.setState({text: 'Add text here'});
  }

 
 GetItem (image_url) {  
  this.setModalVisible(!this.state.modalVisible);
  this.setState({url: image_url}); 
  //console.log(this.state.url);
 }
 
 
 componentDidMount() {
 
   return fetch('http://api.giphy.com/v1/gifs/search?q=javascript&api_key=dc6zaTOxFJmzC&limit=9')
     .then((response) => response.json())
     .then((responseJson) => {
       let ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});       
       this.setState({
         isLoading: false,
         dataSource: ds.cloneWithRows(responseJson.data),
       }, function() {
         
       });
     })
     .catch((error) => {
       console.error(error);
     });
 }
 
 ListViewItemSeparator = () => {
   return (
     <View
       style={{
         height: .5,
         width: "100%",
         backgroundColor: "#000",
       }}
     />
   );
 }

 inputText = () => {
  
 }
 
 
 render() {
   if (this.state.isLoading) {
     return (
       <View style={{flex: 1, paddingTop: 10}}>
         <ActivityIndicator />
       </View>
     );
   }
 
   return (
 
     <View style={styles.MainContainer}>
 
       <ListView
 
         dataSource={this.state.dataSource}
 
         renderSeparator= {this.ListViewItemSeparator}
 
         renderRow={(rowData) =>
 
        <View style={{flex:1, flexDirection: 'row'}}>
          <TouchableHighlight onPress={this.GetItem.bind(this, rowData.images.original_still.url)} style={styles.imageViewContainer}>
             <Image source = {{ uri: rowData.images.original_still.url  }} style={styles.imageViewContainer} />
          </TouchableHighlight>       
 
        </View>
         }
       />
       <Modal animationType="slide" visible={this.state.modalVisible}> 
          <View style={{marginTop: 22}}> 
            <TouchableHighlight
                onPress={() => {
                  this.setModalVisible(!this.state.modalVisible);
                }}>
                <Icon name="ios-close-circle" style={{textAlign: 'right'}}/>

            </TouchableHighlight>              
            <TouchableOpacity onPress={() => console.log(this.state.text)} style={styles.modal}>    
              <ImageBackground source = {{ uri: this.state.url  }} style={styles.imageView}> 
                <TextInput 
                  style={{                 
                  height: 27,                  
                  fontSize: 27, 
                  fontWeight: '600',
                  backgroundColor: 'transparent', 
                  color: 'white'                  
                  }}                  
                  onChangeText= {(text) => this.setState({text})}
                  value = {this.state.text}
                />
              </ImageBackground>              
            </TouchableOpacity> 
            <View>
              <Button title='Upload Meme' onPress={() => Alert.alert('meme posted')} style={styles.buttonStyle}/>
            </View>            
          </View>
        </Modal> 
 
     </View>
   );
 }
}

export default CreateTab1;
 
const styles = StyleSheet.create({ 
MainContainer :{
justifyContent: 'center',
flex:1,
margin: 5,
paddingTop: (Platform.OS === 'ios') ? 5 : 0 
},
 
imageViewContainer: {
width: '75%',
height: 175 ,
margin: 5,
borderRadius : 10 
} ,
imageView: {  
width: '85%',
height: 250 ,
margin: 5,
borderRadius : 10 
} ,
modal: {
  justifyContent: "center",
  alignItems: "center"
},
buttonStyle: {
  color: 'blue',
  borderRadius : 10,
  width: '50%' 
}
});
 
