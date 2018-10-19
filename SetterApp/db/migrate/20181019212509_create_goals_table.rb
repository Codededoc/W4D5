class CreateGoalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.text :body
      t.timestamps
      t.string :title, null: false
    end
    add_index :goals, :user_id, unique: true
  end
end
