import React, { Component } from "react";
import { View, Text, StyleSheet } from "react-native";

import CardComponent from "../CardComponent";

class HomeTab extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>HomeTab</Text>
      </View>
    );
    // return (
    //   <Container style={styles.container}>
    //     <Content>
    //       <CardComponent imageSource="1" likes="9001" />
    //       <CardComponent imageSource="2" likes="623" />
    //       <CardComponent imageSource="3" likes="8999" />
    //     </Content>
    //   </Container>
    // );
  }
}
export default HomeTab;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center"
  }
});
