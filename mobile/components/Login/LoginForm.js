import React, { Component } from "react";
import {
  StyleSheet,
  View,
  TextInput,
  TouchableOpacity,
  Text,
  StatusBar,
  KeyboardAvoidingView,  
  Image
} from "react-native";
import { StackNavigator, SwitchNavigator } from "react-navigation";
import { Container, Content } from "native-base";

import HomeTab from "../AppTabNavigator/HomeTab";
import MainScreen from "../MainScreen";
import SignUpForm from "../SignUp/SignUpForm";

class LoginForm extends React.Component {
  render() {  
    return (
      <View style={styles.container}>
        <StatusBar barStyle="dark-content" />

        <KeyboardAvoidingView style={styles.container} behavior={"padding"}>
          <View style={styles.logoContainer}>
            <Image
              style={styles.logo}
              source={require("../../assets/splash.png")}
            />

            <Text style={styles.title}>Welcome to UofMeme</Text>
          </View>
          
          <View style={styles.formContainer}>
      
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

             <TouchableOpacity
              onPress={() => this.props.navigation.navigate("SignUpForm")}
              style={styles.signUpContainer}
            >
              <Text style={styles.buttonText}>Not a meme-ber? Sign up now!</Text>
            </TouchableOpacity>           
          </View>
        </KeyboardAvoidingView>
      </View>
    );
  }
}

export default SwitchNavigator({
  LoginForm: {
    screen: LoginForm
  },
   MainScreen: {
    screen: MainScreen
  }, 
   SignUpForm: {
    screen: SignUpForm
  },
  initialRouteName: "LoginForm"
});

const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    marginBottom: 10,
    padding: 20,
    flex : 1
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
    paddingVertical: 15,
    marginBottom: 20

  },
  signUpContainer: {
    backgroundColor: "#337ab7",
    paddingVertical: 15,
    marginBottom: 20
  },
  buttonText: {
    textAlign: "center",
    color: "white",
    fontWeight: "700"
  },
  logoContainer: {
    alignItems: "center",
    
    justifyContent: "center"
  },
  logo: {
    width: 100,
    height: 100
  },
  title: {
    color: "black",
    marginTop: 10,
    fontSize: 20,
    fontWeight: "bold",
    width: 200,
    textAlign: "center"
  },
    formContainer: {
    flex: 1
  }
});
