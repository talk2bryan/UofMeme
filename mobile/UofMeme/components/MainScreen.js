import React, { Component } from "react";
import { View, Text, StyleSheet } from "react-native";
import { createBottomTabNavigator, createAppContainer } from "react-navigation";
import Ionicons from "react-native-vector-icons/Ionicons";

// import HomeTab from "./AppTabNavigator/HomeTab";
import HomeTabGrid from "./AppTabNavigator/HomeTabGrid";
import UploadTab from "./AppTabNavigator/UploadTab";

export default class MainScreen extends Component {
  render() {
    return <AppContainer />;
    // return <AppTabNavigator />;
  }
}

const AppTabNavigator = createBottomTabNavigator(
  {
    Home: HomeTabGrid,
    Upload: UploadTab
  },
  {
    defaultNavigationOptions: ({ navigation }) => ({
      tabBarIcon: ({ focused, horizontal, tintColor }) => {
        const { routeName } = navigation.state;
        let IconComponent = Ionicons;
        let iconName;
        if (routeName === "Home") {
          iconName = "ios-home";
          // Sometimes we want to add badges to some icons.
          // You can check the implementation below.
        } else if (routeName === "Upload") {
          iconName = "ios-cloud-upload";
        }

        // You can return any component that you like here!
        return <IconComponent name={iconName} size={25} color={tintColor} />;
      }
    }),
    animationEnabled: true,
    swipeEnabled: true,
    tabBarOptions: {
      activeTintColor: "orange",
      inactiveTintColor: "gray"
      // showLabel: false,
      // showIcon: true
    }
  }
);

const AppContainer = createAppContainer(AppTabNavigator);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center"
  }
});
