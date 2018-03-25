import React, { Component } from 'react';
import { StyleSheet, View, TextInput, TouchableOpacity, Text, StatusBar, KeyboardAvoidingView, Image} from 'react-native';
import { SwitchNavigator } from "react-navigation";
import { Container, Content } from "native-base";

import MainScreen from "../MainScreen";

class SignUpForm extends React.Component {

  render() {
    return (
      <View style={styles.container}>
        <StatusBar
          barStyle="dark-content"
        />
      
        <KeyboardAvoidingView style={styles.container} behavior={'padding'}>
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
              autoCorrect={false}
              style={styles.input}
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
              ref={(input) => this.emailInput = input}
            />
            <TextInput 
              placeholder="Password"
              placeholderTextColor="white"
              secureTextEntry
              returnKeyType="next"
              style={styles.input}
              ref={(input) => this.passwordInput = input}
              onSubmitEditing={() => this.passwordConfirmInput.focus()}
            />

            <TextInput 
              placeholder="Confirm Password"
              placeholderTextColor="white"
              secureTextEntry
              returnKeyType="go"
              style={styles.input}
              ref={(input) => this.passwordConfirmInput = input}
            />        

            <TouchableOpacity onPress={() => this.props.navigation.navigate('MainScreen')} style={styles.buttonContainer}>
              <Text style={styles.buttonText}>Sign Up</Text>
            </TouchableOpacity>
          </View>
        </KeyboardAvoidingView>
      </View>
    );
  }
}

export default SwitchNavigator({
  SignUpForm: {
    screen: SignUpForm
  },
   MainScreen: {
    screen: MainScreen
  },
  initialRouteName: "SignUpForm"
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
  buttonText: {
    textAlign: 'center',
    color: "white",
    fontWeight: '700'
  },
 
  logoContainer: {
    alignItems: 'center',
    
    justifyContent: 'center'
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
    textAlign: 'center'
  },
  subtitle: {
    color: "black",
    marginTop: 5,
    marginBottom: 5,
    fontSize: 18,
    width: 250,
    textAlign: 'center',
    opacity: 0.8
  },
  formContainer: {
    flex: 1
  }
});