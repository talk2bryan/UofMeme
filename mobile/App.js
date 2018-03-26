import React from "react";
import {
  StyleSheet,
  Text,
  View,
  ActivityIndicator,
  AsyncStorage
} from "react-native";
import { Router, Scene } from "react-native-router-flux";

import LoginForm from "./components/Login/LoginForm";
import SignUpForm from "./components/SignUp/SignUpForm";
import MainScreen from "./components/MainScreen";

class App extends React.Component {
  constructor() {
    super();
    this.state = { hasToken: false, isLoaded: false };
  }

  componentDidMount() {
    AsyncStorage.getItem("id_token").then(token => {
      this.setState({ hasToken: token !== null, isLoaded: true });
    });
  }

  render() {
    if (!this.state.isLoaded) {
      return <ActivityIndicator />;
    } else {
      return (
        <Router>
          <Scene key="root">
            <Scene
              component={LoginForm}
              hideNavBar={true}
              initial={true}
              key="LoginForm"
              title="Login"
            />
            <Scene
              component={SignUpForm}
              hideNavBar={true}
              initial={true}
              key="SignUpForm"
              title="Sign Up"
            />
            <Scene component={MainScreen} key="MainScreen" title="Home Page" />
          </Scene>
        </Router>
      );
    }
  }
}

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center"
  }
});
