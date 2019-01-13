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

// /*This is an Example of Grid View in React Native*/
// import React, { Component } from "react";
// //import rect in our project
// import {
//   StyleSheet,
//   View,
//   FlatList,
//   ActivityIndicator,
//   Image,
//   TouchableOpacity
// } from "react-native";
// //import all the components we will need

// export default class App extends Component {
//   constructor() {
//     super();
//     this.state = {
//       dataSource: {}
//     };
//   }
//   componentDidMount() {
//     var that = this;
//     let items = Array.apply(null, Array(60)).map((v, i) => {
//       return { id: i, src: "http://placehold.it/200x200?text=" + (i + 1) };
//     });
//     that.setState({
//       dataSource: items
//     });
//   }
//   render() {
//     return (
//       // <View style={styles.MainContainer}>
//       //   <FlatList
//       //     data={this.state.dataSource}
//       //     renderItem={({ item }) => (
//       //       <View style={{ flex: 1, flexDirection: "column", margin: 1 }}>
//       //         <Image style={styles.imageThumbnail} source={{ uri: item.src }} />
//       //       </View>
//       //     )}
//       //     //Setting the number of column
//       //     numColumns={3}
//       //     keyExtractor={(item, index) => index}
//       //   />
//       // </View>

//       <View style={styles.MainContainer}>
//         <FlatList
//           data={this.state.dataSource}
//           renderItem={({ item }) => (
//             <View style={{ flex: 1, flexDirection: "column", margin: 1 }}>
//               <Image style={styles.imageThumbnail} source={{ uri: item.src }} />
//             </View>
//           )}
//           //Setting the number of column
//           numColumns={3}
//           keyExtractor={(item, index) => index}
//         />
//       </View>
//     );
//   }
// }

// const styles = StyleSheet.create({
//   MainContainer: {
//     justifyContent: "center",
//     flex: 1,
//     paddingTop: 30
//   },
//   imageThumbnail: {
//     justifyContent: "center",
//     alignItems: "center",
//     height: 100
//   }
// });
