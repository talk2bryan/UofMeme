import React from 'react';
import Intro from '../components/MainScreen';

import renderer from 'react-test-renderer';

test('renders correctly', () => {
	const tree = renderer.create(<MainScreen/>).toJSON();
	expect(tree).toMatchSnapshot();
});

