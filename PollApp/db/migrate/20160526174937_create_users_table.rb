class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
      t.index :username, unique: true
    end
  end
end
