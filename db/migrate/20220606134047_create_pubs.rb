class CreatePubs < ActiveRecord::Migration[7.0]
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :brand
      t.boolean :wheelchair
      t.string :smoking
      t.float :latitude
      t.float :longitude


      t.timestamps
    end
  end
end
