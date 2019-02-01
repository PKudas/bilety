class Ticket < ApplicationRecord
	validates :name, :presence => true, :format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
	validates :address, :presence => true, :length => {:minimum =>5}
	validates :seat_id_seq, :presence => true, length: {:is => 3}
	validates :email_address, :presence => true, :format => {:with => /@/, :message => "has to contain @"}
	validates :price, :presence => true
	validates :phone, :presence => true, length: {:is => 9}
	
	belongs_to :event, required: false
	belongs_to :user, required: false
	
	def price_range2
		if price> price_high && price<price_low
			errors.add('Niepoprawny zakres cenowy')
		end
	end
end
