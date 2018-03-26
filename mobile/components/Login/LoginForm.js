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

import HomeTab from "../AppTabNavigator/HomeTab";
import MainScreen from "../MainScreen";
import SignUpForm from "../SignUp/SignUpForm";

class LoginForm extends React.Component {
  constructor() {
    super();
    this.state = { email: null, pw: null };
  }

  static navigationOptions = ({ navigation }) => {
    return { headerLeft: <View /> };
  };

  async saveItem(item, selectedValue) {
    try {
      await AsyncStorage.setItem(item, selectedValue);
    } catch (error) {
      console.error("AsyncStorage error: " + error.message);
    }
  }

  userSignup() {
    Actions.SignUpForm();
  }

  userLogin() {
    if (!this.state.email || !this.state.pw) return;
    fetch("http://uofmeme.solutions/api/v1/login", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        email: this.state.email,
        password: this.state.pw
      })
    })
      .then(responseData => {
        console.log(responseData.ok);
        if (responseData.ok) {
          this.saveItem("id", responseData.id),
            Alert.alert("Login Success!"),
            Actions.MainScreen();
        } else {
          Alert.alert("Invalid email or password.");
        }
      })
      .done();
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
          </View>

          <View style={styles.formContainer}>
            <TextInput
              editable={true}
              onChangeText={email => this.setState({ email })}
              placeholder="email@myumanitoba.ca"
              placeholderTextColor="white"
              ref="email"
              returnKeyType="next"
              onSubmitEditing={() => this.passwordInput.focus()}
              keyboardType="email-address"
              autoCapitalize="none"
              autoCorrect={false}
              style={styles.input}
              value={this.state.emaiil}
            />

            <TextInput
              editable={true}
              onChangeText={pw => this.setState({ pw })}
              placeholder="Password"
              placeholderTextColor="white"
              ref="pw"
              secureTextEntry={true}
              returnKeyType="go"
              style={styles.input}
              value={this.state.pw}
              // ref={input => (this.passwordInput = input)}
            />

            <TouchableOpacity
              onPress={this.userLogin.bind(this)}
              style={styles.buttonContainer}
            >
              <Text style={styles.buttonText}>LOGIN</Text>
            </TouchableOpacity>

            <TouchableOpacity
              onPress={this.userSignup.bind(this)}
              style={styles.signUpContainer}
            >
              <Text style={styles.buttonText}>
                Not a meme-ber? Sign up now!
              </Text>
            </TouchableOpacity>
          </View>
        </KeyboardAvoidingView>
      </View>
    );
  }
}

export default LoginForm;

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
    marginBottom: 10,
    fontSize: 20,
    fontWeight: "bold",
    width: 200,
    textAlign: "center"
  },
  formContainer: {
    flex: 1
  }
});
