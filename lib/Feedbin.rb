require 'httparty'
require 'Feedbin/version'

class Feedbin
  attr_reader :email, :password, :base_uri, :all_tags, :subscriptions, :all_tagged, :last_updated

  def print_version
    Feedbin::VERSION
  end

  def initialize(email, password, uri)
    @email = email
    @password = password
    @base_uri = uri
    @options = {basic_auth: {username: @email, password: @password}}

    @last_updated = nil

    update_from_feedbin
  end

  def update_from_feedbin
    retrieve_tags
    retrieve_subs
    apply_tags_to_subscriptions

    @last_updated = DateTime.now
  end

  def subscriptions_for_tag(tag_name)
    if tag_name.nil? || tag_name == ''
      @subscriptions.select { |s| s['tags'].nil? || s['tags'] == []}
    else
      @subscriptions.select { |s| s['tags'].include?(tag_name) }
    end
  end

  def delete_subscription(id)
    res = HTTParty.delete("#{@base_uri}/subscriptions/#{id}.json")

    if res.code == 204
      @subscriptions.delete_if { |sub| sub['id'] == id }
      return true
    end

    false
  end

  def delete_all_subs_for_tag(tag_name)
    subscriptions_for_tag(tag_name).each do |s|
      delete_subscription(s['id'])
    end
  end

  private
  def retrieve_tags
    @all_tagged = HTTParty.get "#{@base_uri}/taggings.json", @options
    @all_tags = @all_tagged.map { |t| t['name'] }.flatten.uniq.sort
  end

  def retrieve_subs
    @subscriptions = HTTParty.get "#{@base_uri}/subscriptions.json", @options
  end

  def find_sub_tags(feed_id, tags)
    tags.select { |t| t['feed_id'] == feed_id }.map { |t| t['name'] }
  end

  def apply_tags_to_subscriptions
    @subscriptions.each do |sub|
      tag_info = find_sub_tags sub['feed_id'], @all_tagged
      sub['tags'] = tag_info || []
    end
  end
end
