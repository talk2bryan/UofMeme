import React, { Component } from "react";
import { View, Text, StyleSheet, Button } from "react-native";
import { Container, Content, Icon } from "native-base";

import CardComponent from "../CardComponent";

class HomeTab extends Component {
  render() {
    return (
      <Container>
        <Content>
          <CardComponent imageSource="1" likes="9001" />
          <CardComponent imageSource="2" likes="623" />
          <CardComponent imageSource="3" likes="8999" />
        </Content>  
      </Container>
    );
  }
}

export default HomeTab;
