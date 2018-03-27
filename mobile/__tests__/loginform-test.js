import 'react-native';
import React from 'react';
import renderer from 'react-test-renderer';
import "isomorphic-fetch";

import LoginForm from '../components/Login/LoginForm';



it('renders correctly', () => {
  const tree = renderer.create(
    <LoginForm />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});