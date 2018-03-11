import React, { Component } from "react";
import { View, Text, StyleSheet } from "react-native";

import { Icon } from "native-base";

class UploadTab extends Component {
  static navigationOptions = {
    tabBarIcon: ({ tintColor }) => (
      <Icon name="ios-cloud-upload" style={{ color: tintColor }} />
    )
  };

  render() {
    return (
      <View style={styles.container}>
        <Text>UploadTab</Text>
      </View>
    );
  }
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
