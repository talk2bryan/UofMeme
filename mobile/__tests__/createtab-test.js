import 'react-native';
import React from 'react';
import CreateTab from '../components/AppTabNavigator/CreateTab';

import renderer from 'react-test-renderer';

it('renders correctly', () => {
  const tree = renderer.create(
    <CreateTab />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});