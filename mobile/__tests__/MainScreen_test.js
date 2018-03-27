import React from 'react';
import "isomorphic-fetch";
import renderer from 'react-test-renderer';

import MainScreen from '../components/MainScreen';

test('renders correctly', () => {
	const tree = renderer.create(<MainScreen/>).toJSON();
	expect(tree).toMatchSnapshot();
});

