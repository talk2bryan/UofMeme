import React from "react";
import { StyleSheet, Text, View } from "react-native";
import { StackNavigator } from "react-navigation";
//import MainScreen from "./components/MainScreen";
import Login from "./components/Login/Login";

export default class App extends React.Component {
  render() {
    return <AppStackNavigator />;
  }
}

const AppStackNavigator = StackNavigator({
  Main: {
    screen: Login
  }
});

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center"
  }
});
