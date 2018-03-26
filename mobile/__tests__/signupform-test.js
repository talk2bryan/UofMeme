import 'react-native';
import React from 'react';
import SignUpForm from '../components/SignUp/SignUpForm';

import renderer from 'react-test-renderer';


it('renders correctly', () => {
  const tree = renderer.create(
    <SignUpForm />
    ).toJSON();
  expect(tree).toMatchSnapshot();
});