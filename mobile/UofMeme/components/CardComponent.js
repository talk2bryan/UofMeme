import React, { Component } from "react";
import { View, Text, StyleSheet, Image } from "react-native";

import {
  Card,
  CardItem,
  Container,
  Content,
  Header,
  Thumbnail,
  Body,
  Left,
  Right,
  Button,
  Icon
} from "native-base";

class CardComponent extends Component {
  render() {
    const images = {
      "1": require("../assets/test_images/1.jpg"),
      "2": require("../assets/test_images/2.jpg"),
      "3": require("../assets/test_images/3.jpg")
    };

    return (
      <Card>
        <CardItem>
          <Left>
            {/* <Thumbnail source={require("../assets/me.jpg")} /> */}
            <Body>
              <Text style={{ fontWeight: "900" }}>nrmarzo</Text>
              <Text note>Jan 9, 2019</Text>
            </Body>
          </Left>
        </CardItem>

        <CardItem cardBody>
          <Image
            source={images[this.props.imageSource]}
            style={{ height: 250, width: 0, flex: 1 }}
          />
        </CardItem>

        <CardItem>
          <Left>
            <Button transparent>
              <Icon name="ios-thumbs-up" style={{ color: "black" }} />
            </Button>
            <Button transparent>
              <Icon name="ios-thumbs-down" style={{ color: "black" }} />
            </Button>
            <Button transparent>
              <Icon name="ios-chatbubbles" style={{ color: "black" }} />
            </Button>
          </Left>
        </CardItem>
        <CardItem style={{ height: 20 }}>
          <Text>{this.props.likes} likes</Text>
        </CardItem>

        <CardItem>
          <Body>
            <Text>
              <Text style={{ fontWeight: "900" }}>neil </Text>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam
              quas, sit praesentium debitis quasi delectus hic aut sed, velit
              ipsum nulla, suscipit sint impedit fugiat! Itaque sapiente modi
              explicabo voluptatem!
            </Text>
          </Body>
        </CardItem>
      </Card>
    );
  }
}

//make this component available to the app
export default CardComponent;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  }
});
