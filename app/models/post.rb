class Post < ActiveRecord::Base
  has_many :poststags
  has_many :tags, :through => :poststags
end
