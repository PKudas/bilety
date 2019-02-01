class AddPhoneToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :phone, :string
  end
end
