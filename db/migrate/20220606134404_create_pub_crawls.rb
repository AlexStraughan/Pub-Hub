class CreatePubCrawls < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_crawls do |t|
      t.string :name
      t.datetime :time

      t.timestamps
    end
  end
end
