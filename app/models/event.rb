class Event < ApplicationRecord
	validates :artist, :presence => true, :format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
	validates :price_low, :presence => true, :length => { :in => 1..1000  }
	validates :price_high, :presence => true, :length => { :in => 1..10000  }
	validates :event_date, :presence => true
	has_many :tickets
	
	def event_date_not_from_past
		if event_date < Date.today
			errors.add('Data wydarzenia', 'nie może być z przeszłości')
		end
	end
	
	def price_range
		if price_high < price_low
			errors.add('Niepoprawny zakres cenowy')
		end
	end
end
