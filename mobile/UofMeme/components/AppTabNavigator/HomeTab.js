import React, { Component } from "react";
import { View, Text, StyleSheet } from "react-native";

class HomeTab extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>HomeTab</Text>
      </View>
    );
  }
}
export default HomeTab;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center"
  }
});
