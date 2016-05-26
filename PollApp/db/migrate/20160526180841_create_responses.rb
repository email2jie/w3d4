class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id, null: false
      t.integer :responder_id, null: false
      t.timestamps

      t.index :answer_choice_id
      t.index :responder_id
    end
  end
end
