class Empty < ActiveRecord::Migration[5.2]
	add_reference :tickets, :event, foreign_key: true
end
