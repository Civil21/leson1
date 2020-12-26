class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
