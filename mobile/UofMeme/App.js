import React from "react";
import { StyleSheet, View, Text } from "react-native";
import { createStackNavigator, createAppContainer } from "react-navigation";
import { Icon } from "native-base";

import MainScreen from "./components/MainScreen";

export default class App extends React.Component {
  render() {
    return <AppContainer />;
  }
}

const AppStackNavigator = createStackNavigator(
  {
    Main: MainScreen
  },
  {
    defaultNavigationOptions: {
      headerStyle: {
        backgroundColor: "orange"
      },
      title: "UofMeme",
      headerRight: <Icon style={{ paddingRight: 15 }} name="camera" />
    }
  }
);

const AppContainer = createAppContainer(AppStackNavigator);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center"
  }
});
