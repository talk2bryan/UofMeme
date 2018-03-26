import 'react-native';
import React from 'react';
import HomeTab from '../components/AppTabNavigator/HomeTab';

import renderer from 'react-test-renderer';


it('renders correctly', () => {
  const tree = renderer.create(
    <HomeTab />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});