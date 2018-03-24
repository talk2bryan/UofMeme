import React, { Component } from "react";
import { View, Text, StyleSheet, Image } from "react-native";

import {
  Card,
  CardItem,
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
      "1": require("../assets/feed_images/1.jpg"),
      "2": require("../assets/feed_images/2.jpg"),
      "3": require("../assets/feed_images/3.jpg")
    };

    return (
      <Card>
        <CardItem>
          <Left>
            {/* <Thumbnail source={require("../assets/me.jpg")} /> */}
            <Body>
              <Text>Neil</Text>
              <Text note>March 10, 2018</Text>
            </Body>
          </Left>
        </CardItem>
        <CardItem cardBody>
          <Image
            source={images[this.props.imageSource]}
            style={{ height: 300, width: null, flex: 1 }}
          />
        </CardItem>
        <CardItem>
          <Left>
            <Button transparent>
              <Icon name="ios-thumbs-up-outline" style={{ color: "black" }} />
            </Button>
            <Button transparent>
              <Icon name="ios-thumbs-down-outline" style={{ color: "black" }} />
            </Button>
            <Button transparent>
              <Icon name="ios-chatbubbles-outline" style={{ color: "black" }} />
            </Button>
          </Left>
        </CardItem>
        <CardItem style={{ height: 20 }}>
          <Text>{this.props.likes} likes</Text>
        </CardItem>

        <CardItem>
          <Body>
            <Text>
              <Text style={{ fontWeight: "900" }}>neil</Text>
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
