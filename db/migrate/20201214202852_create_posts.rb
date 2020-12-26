class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body
      t.integer :user_id, null: false
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
