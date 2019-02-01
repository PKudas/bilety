class Empty1 < ActiveRecord::Migration[5.2]
  add_reference :tickets, :user, foreign_key: true
end
