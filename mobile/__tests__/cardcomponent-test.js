import React from 'react';
import { shallow } from 'enzyme';
import "isomorphic-fetch";

import CardComponent from '../components/CardComponent';
import setupTests from '../setupTests';

describe('Testing CardComponent', () => {
  it('renders as expected', () => {
  	
    const wrapper = shallow(
      <CardComponent count={3} />
    );
    expect(wrapper).toMatchSnapshot();
    wrapper.setProps({ count: 1 });
    expect(wrapper).toMatchSnapshot();
  });
});