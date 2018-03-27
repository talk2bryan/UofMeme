import 'react-native';
import React from 'react';
import "isomorphic-fetch";
import renderer from 'react-test-renderer';

import CreateTab from '../components/AppTabNavigator/CreateTab';

it('renders correctly', () => {
  const tree = renderer.create(
    <CreateTab />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});