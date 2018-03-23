import React, { Component } from "react";
import {
  StyleSheet,
  View,
  TextInput,
  TouchableOpacity,
  Text,
  StatusBar
} from "react-native";
import { StackNavigator, SwitchNavigator } from "react-navigation";

import HomeTab from "../AppTabNavigator/HomeTab";
import MainScreen from "../MainScreen";

class LoginForm extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <StatusBar barStyle="dark-content" />

        <TextInput
          placeholder="username@myumanitoba.ca"
          placeholderTextColor="white"
          returnKeyType="next"
          onSubmitEditing={() => this.passwordInput.focus()}
          keyboardType="email-address"
          autoCapitalize="none"
          autoCorrect={false}
          style={styles.input}
        />
        <TextInput
          placeholder="Password"
          placeholderTextColor="white"
          secureTextEntry
          returnKeyType="go"
          style={styles.input}
          ref={input => (this.passwordInput = input)}
        />

        <TouchableOpacity
          onPress={() => this.props.navigation.navigate("MainScreen")}
          style={styles.buttonContainer}
        >
          <Text style={styles.buttonText}>LOGIN</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

// const AppStackNavigator = StackNavigator(
//   {
//     MainScreen: {
//       screen: MainScreen
//     }
//   },
//   {
//     // initialRouteName: "Log"
//   }
// );

export default SwitchNavigator({
  LoginForm: {
    screen: LoginForm
  },
  MainScreen: {
    screen: MainScreen
  },
  initialRouteName: "LoginForm"
});

// export default class App extends React.Component {
//   render() {
//     return <AppStackNavigator />;
//   }
// }

const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    padding: 20
  },
  input: {
    height: 40,
    backgroundColor: "gray",
    marginBottom: 20,
    color: "white",
    paddingHorizontal: 10
  },
  buttonContainer: {
    backgroundColor: "darkgrey",
    paddingVertical: 15
  },
  buttonText: {
    textAlign: "center",
    color: "white",
    fontWeight: "700"
  }
});
