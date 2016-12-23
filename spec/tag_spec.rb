require 'spec_helper'

describe Feedbin::Tag do
  it 'instantiates correctly' do
    test_data = {}
    test_data['id'] = 2_345_054
    test_data['feed_id'] = 341_811
    test_data['name'] = 'mac-tech'

    tag = Feedbin::Tag.new(test_data)

    expect(tag.id).to eq 2_345_054
    expect(tag.feed_id).to eq 341_811
    expect(tag.name).to eq 'mac-tech'
  end
end
