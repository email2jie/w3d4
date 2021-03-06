class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
      t.timestamps

      t.index :title
      t.index :author_id
    end
  end
end
