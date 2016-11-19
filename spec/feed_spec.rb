require 'spec_helper'

describe Feedbin::Feed do
  it 'instantiates correctly' do
    test_data = {}

    test_data['id'] = 12_345
    test_data['created_at'] = '2014-11-07T17:22:23.126131Z'
    test_data['title'] = 'Daring Fireball'
    test_data['feed_id'] = 54_321
    test_data['site_url'] = 'http://daringfireball.com'
    test_data['feed_url'] = 'http://daringfireball.com/feed'

    fd = Feedbin::Feed.new(test_data)

    expect(fd).not_to be nil
    expect(fd.id).to eq 12_345
    expect(fd.feed_id).to eq 54_321
    expect(fd.title).to eq 'Daring Fireball'
  end
end
