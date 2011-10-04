class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :type_of_instrument
      t.boolean :temperature
      t.boolean :pressure
      t.boolean :humidity

      t.timestamps
    end
  end
end
