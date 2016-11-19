# rubocop:disable Metrics/BlockLength
require 'spec_helper'

describe Feedbin do
  before(:all) do
    @fb = Feedbin.new('d@e.com', '12345', 'http://localhost:3002')
    @fb.update
  end

  it 'initializes correctly' do
    expect(@fb.subscriptions).not_to be nil
    expect(@fb.subscriptions.length).to be > 0

    expect(@fb.all_tags).not_to be nil
    expect(@fb.all_tags.length).to be > 0
  end

  it 'splits tags out correctly' do
    expect(@fb.all_tags[0]).to eq 'blogs'
  end

  it 'applies tags to feeds' do
    first_sub = @fb.subscriptions[0]
    expect(first_sub.tags).to eq ['mac-tech']
  end

  it 'gets all subscriptions for a tag' do
    expect(@fb.subscriptions_for_tag('mac-tech').length).to eq 17
  end

  it "gets subscriptions that don't have a tag" do
    expect(@fb.subscriptions_for_tag(nil).length).to eq 1
  end

  it 'deletes a subscription' do
    expect(@fb.delete_subscription(2_758_016)).to eq true
    expect(@fb.subscriptions.any? { |s| s.feed_id == 2_758_016 }).to eq false
  end

  it 'deletes all subscriptions in a tag' do
    @fb.delete_all_subs_for_tag('blogs')
    expect(@fb.subscriptions_for_tag('blogs').length).to eq 0
  end

  it 'should set the last updated date' do
    expect(@fb.last_updated).not_to eq nil
  end

  it 'should not update twice within five minutes' do
    first_update = @fb.last_updated
    @fb.update
    expect(first_update).to eq @fb.last_updated
  end
end
