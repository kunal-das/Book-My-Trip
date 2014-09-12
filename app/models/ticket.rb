class Ticket < ActiveRecord::Base
	validates :from, presence: true, length: { maximum: 50 }
	validates :to, presence: true, length: { maximum: 50 }
	VALID_DATE_REGEX = /\A(\d\d)[\/-](\d\d)[\/-](\d\d\d\d)\z/
	validates :date_of_journey, presence: true, format: { with: VALID_DATE_REGEX }
	validates :journey_direction, presence: true
end
