class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.text :display_name
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
