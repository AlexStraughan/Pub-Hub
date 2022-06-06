class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.references :pub, null: false, foreign_key: true
      t.references :pub_crawl, null: false, foreign_key: true

      t.timestamps
    end
  end
end
