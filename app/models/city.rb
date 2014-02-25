class City < ActiveRecord::Base
	has_many :postcodes
	belongs_to :state
end
