class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :from
      t.string :to
      t.date :date_of_journey
      t.string :journey_direction

      t.timestamps
    end
  end
end
