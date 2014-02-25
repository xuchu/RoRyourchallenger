class Location < ActiveRecord::Base
	belongs_to :postcode
	belongs_to :city
	belongs_to :state
	belongs_to :country
	belongs_to :user
end
