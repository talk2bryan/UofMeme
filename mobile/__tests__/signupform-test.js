import 'react-native';
import React from 'react';
import renderer from 'react-test-renderer';
import "isomorphic-fetch";

import SignUpForm from '../components/SignUp/SignUpForm';

it('renders correctly', () => {
  const tree = renderer.create(
    <SignUpForm />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});