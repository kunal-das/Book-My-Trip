class ChangeColumnToTicketsDateOfJourney < ActiveRecord::Migration
  def change
  	change_column :tickets, :date_of_journey,  :string
  end
end
