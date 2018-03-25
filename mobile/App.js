import React from "react";
import { StyleSheet, Text, View } from "react-native";
import { StackNavigator } from "react-navigation";

import LoginForm from "./components/Login/LoginForm";

export default class App extends React.Component {
  render() {    
    return <AppStackNavigator />;
  }
}

const AppStackNavigator = StackNavigator({
  LoginForm: {
    screen: LoginForm
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
