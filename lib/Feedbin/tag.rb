class Feedbin::Tag
  attr_accessor :id, :feed_id, :name

  def initialize(tag_hash)
    @id = tag_hash['id']
    @feed_id = tag_hash['feed_id']
    @name = tag_hash['name']
  end
end
