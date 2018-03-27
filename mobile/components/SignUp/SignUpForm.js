import React, { Component } from "react";
import {
  StyleSheet,
  View,
  TextInput,
  TouchableOpacity,
  Text,
  StatusBar,
  KeyboardAvoidingView,
  Image,
  AsyncStorage,
  Alert
} from "react-native";
import { Actions } from "react-native-router-flux";
import { Container, Content } from "native-base";

import MainScreen from "../MainScreen";
import LoginForm from "../Login/LoginForm";

class SignUpForm extends React.Component {
  
  constructor() {
    super();
    this.state = { username: null, email: null, pw: null, confirmpw: null };
  }

  static navigationOptions = ({ navigation }) => {
    return { headerLeft: <View /> };
  };

  userSignup() {
    if (!this.state.username || !this.state.email || !this.state.pw) return;
    fetch("http://uofmeme.solutions/api/v1/users", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        password: this.state.pw,
        username: this.state.username,
        email: this.state.email,
        password_confirmation: this.state.confirmpw
      })
    })
      .then(responseData => {
        var response = JSON.parse(responseData._bodyInit);
        console.log(responseData);
        if (responseData.ok) {
            Alert.alert("Signup Success! "),
            Actions.LoginForm();
        } else {
          var errorMsg = "";

          console.log(response);
          if(typeof response.username != 'undefined'){
            errorMsg += "Username " + response.username[0].message + "\n"
          } else if(typeof response.email != 'undefined') {
            errorMsg += "Email " + response.email[0].message + "\n"
          } else if(typeof response.password != 'undefined') {
            errorMsg += "Password " + response.password[0].message + "\n"
          } else if(typeof response.password_confirmation != 'undefined') {
            errorMsg += "Password confirmation " + response.password_confirmation[0].message
          }

          Alert.alert(errorMsg);
        }
      })
      .done();
  }

  userLogin() {
    Actions.LoginForm();
  }

  render() {
    return (
      <View style={styles.container}>
        <KeyboardAvoidingView style={styles.container} behavior={"padding"}>
          <View style={styles.logoContainer}>
            <Image
              style={styles.logo}
              source={require("../../assets/splash.png")}
            />

            <Text style={styles.title}>Welcome to UofMeme</Text>
            <Text style={styles.subtitle}>Become a meme-ber today!</Text>
          </View>

          <View style={styles.formContainer}>
            <TextInput
              placeholder="Username"
              placeholderTextColor="white"
              returnKeyType="next"
              onSubmitEditing={() => this.emailInput.focus()}
              autoCapitalize="none"
              autoCorrect={false}
              style={styles.input}
              onChangeText={username => this.setState({ username })}
            />

            <TextInput
              placeholder="example@myumanitoba.ca"
              placeholderTextColor="white"
              returnKeyType="next"
              onSubmitEditing={() => this.passwordInput.focus()}
              keyboardType="email-address"
              autoCapitalize="none"
              autoCorrect={false}
              style={styles.input}
              ref={input => (this.emailInput = input)}
              onChangeText={email => this.setState({ email })}
            />
            <TextInput
              placeholder="Password"
              placeholderTextColor="white"
              secureTextEntry
              returnKeyType="next"
              style={styles.input}
              ref={input => (this.passwordInput = input)}
              onSubmitEditing={() => this.passwordConfirmInput.focus()}
              onChangeText={pw => this.setState({ pw })}
            />

            <TextInput
              placeholder="Confirm Password"
              placeholderTextColor="white"
              secureTextEntry
              returnKeyType="go"
              style={styles.input}
              ref={input => (this.passwordConfirmInput = input)}
              onChangeText={confirmpw => this.setState({ confirmpw })}
            />

            <TouchableOpacity
              onPress={this.userSignup.bind(this)}
              style={styles.buttonContainer}
            >
              <Text style={styles.buttonText}>SIGN UP</Text>
            </TouchableOpacity>

            <TouchableOpacity
              onPress={this.userLogin.bind(this)}
              style={styles.loginContainer}
            >
              <Text style={styles.buttonText}>
                Already have an account? Login here!
              </Text>
            </TouchableOpacity>
          </View>
        </KeyboardAvoidingView>
      </View>
    );
  }
}

export default SignUpForm;

const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    marginBottom: 10,
    padding: 20,
    flex: 1
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
  loginContainer: {
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
  subtitle: {
    color: "black",
    marginTop: 5,
    marginBottom: 5,
    fontSize: 18,
    width: 250,
    textAlign: "center",
    opacity: 0.8
  },
  formContainer: {
    flex: 1
  }
});
