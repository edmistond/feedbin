class Feedbin::Feed
  attr_accessor :id, :created_at, :feed_id, :title, :feed_url, :site_url

  def initialize(feed_hash)
    @id = feed_hash['id']
    @created_at = feed_hash['created_at']
    @feed_id = feed_hash['feed_id']
    @title = feed_hash['title']
    @feed_url = feed_hash['feed_url']
    @site_url = feed_hash['site_url']
  end
end
