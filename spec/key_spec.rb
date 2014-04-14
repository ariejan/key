require 'spec_helper'

describe Key do
  it 'should have a version number' do
    Key::VERSION.should_not be_nil
  end
end
