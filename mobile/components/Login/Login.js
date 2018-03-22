import React, { Component } from 'react';
import { StyleSheet, View, Image, Text, KeyboardAvoidingView } from 'react-native';
import LoginForm from './LoginForm';

export default class Login extends Component {
  render() {
    return (
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
      		<LoginForm/>
      	</View>
      </KeyboardAvoidingView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "white"
  },
  logoContainer: {
  	alignItems: 'center',
  	flexGrow: 1,
  	justifyContent: 'center'
  },
  logo: {
  	width: 150,
  	height: 150
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
  	fontSize: 18,
  	width: 250,
  	textAlign: 'center',
  	opacity: 0.8
  },
  formContainer: {
  	marginBottom: 40
  }
});