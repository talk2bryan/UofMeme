import React, { Component } from "react";
import { View, Text, StyleSheet } from "react-native";
import { createBottomTabNavigator, createAppContainer } from "react-navigation";

import HomeTab from "./AppTabNavigator/HomeTab";
import UploadTab from "./AppTabNavigator/UploadTab";

// class MainScreen extends Component {
//   render() {
//     return (
//       <AppTabNavigator />
//       //   <View style={styles.container}>
//       //     <Text>U of Meme</Text>
//       //     <Text>Main Screen</Text>
//       //   </View>
//     );
//   }
// }

const AppTabNavigator = createBottomTabNavigator({
  Home: HomeTab,
  Upload: UploadTab
});

export default createAppContainer(AppTabNavigator);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center"
  }
});
