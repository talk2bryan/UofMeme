import 'react-native';
import React from 'react';
import UploadTab from '../components/AppTabNavigator/UploadTab';
import "isomorphic-fetch";
import renderer from 'react-test-renderer';

it('renders correctly', () => {
  const tree = renderer.create(
    <UploadTab />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});