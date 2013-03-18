class Post < ActiveRecord::Base
  has_many :poststags
  has_many :tags, :through => :poststags

  validates :body, :presence => true
  validates :title, :presence => true

  
end
