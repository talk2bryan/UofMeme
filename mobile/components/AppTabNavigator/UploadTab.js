import React, { Component } from "react";
import { View, Text, StyleSheet, Button } from "react-native";

import { Icon } from "native-base";
import { ImagePicker } from "expo";

class UploadTab extends React.Component {
  static navigationOptions = {
    tabBarIcon: ({ tintColor }) => (
      <Icon name="ios-cloud-upload" style={{ color: tintColor }} />
    )
  };

  state = {
    image: null
  };

  render() {
    let { image } = this.state;

    return (
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center" }}>
        <Button
          title="Pick an image from camera roll"
          onPress={this._pickImage}
        />
        {image && (
          <Image source={{ uri: image }} style={{ width: 200, height: 200 }} />
        )}
      </View>
    );
  }

  // return (
  //   <View style={styles.container}>
  //     <Text>UploadTab</Text>
  //   </View>
  // );
  // }

  _pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      allowsEditing: true,
      aspect: [4, 3]
    });

    console.log(result);

    if (!result.cancelled) {
      this.setState({ image: result.uri });
    }
  };
}

//make this component available to the app
export default UploadTab;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  }
});
