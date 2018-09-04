class Artist < ActiveRecord::Base
  # add associations
  has_many :songs
end
