import React, { Component } from "react";
import { 
  View, 
  Text, 
  StyleSheet, 
  Platform, 
  TouchableOpacity, 
  AppRegistry,
  AsyncStorage,
  Alert 
} from "react-native";

import { Icon } from "native-base";
import { TabNavigator } from "react-navigation";

import HomeTab from "./AppTabNavigator/HomeTab";
import UploadTab from "./AppTabNavigator/UploadTab";
import CreateTab from "./AppTabNavigator/CreateTab";
import LoginForm from './Login/LoginForm';

class MainScreen extends Component {

  static navigationOptions =({navigation}) => {
    const{navigate} =  navigation;
    return{
      title: "UofMeme",
      headerRight: 
      <TouchableOpacity onPress={() => navigate("LoginForm")}>
        <Icon style={{ paddingRight: 15 }} name="ios-log-out-outline" />
      </TouchableOpacity>,
      headerLeft: (<View></View>)
    };
  };

  render() {
    return <AppTabNavigator />;
  }
}

export default MainScreen;

const AppTabNavigator = TabNavigator(
  {
    HomeTab: {
      screen: HomeTab
    },
    UploadTab: {
      screen: UploadTab
    },
    CreateTab: {
      screen: CreateTab
    }
  },
  {
    tabBarPosition: "bottom",
    animationEnabled: true,
    swipeEnabled: true,
    tabBarOptions: {
      activeTintColor: "#000",
      inactiveTintColor: "#7d7b7b",
      showLabel: false,
      showIcon: true,
      labelStyle: {
        fontSize: 12
      },
      style: {
        ...Platform.select({
          android: {
            backgroundColor: "#fff"
          }
        })
      }
    }
  }
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  }
});

