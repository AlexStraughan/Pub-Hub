class CreateUserPubCrawls < ActiveRecord::Migration[7.0]
  def change
    create_table :user_pub_crawls do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pub_crawl, null: false, foreign_key: true

      t.timestamps
    end
  end
end
