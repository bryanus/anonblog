class Tag < ActiveRecord::Base
  has_many :poststags
  has_many :posts, :through => :poststags
  # means you can run tag.posts to get the posts associated with a tag

end











