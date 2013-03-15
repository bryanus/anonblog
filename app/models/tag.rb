class Tag < ActiveRecord::Base
  has_many :poststags
  has_many :posts, :through => :poststags
  
end
