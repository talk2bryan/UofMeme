import 'react-native';
import React from 'react';
import renderer from 'react-test-renderer';
import "isomorphic-fetch";

import HomeTab from '../components/AppTabNavigator/HomeTab';

it('renders correctly', () => {
  const tree = renderer.create(
    <HomeTab />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});