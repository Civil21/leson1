class RemoveFieldToComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :post_id
    remove_column :comments, :comment_id
    add_column :comments, :object_id, :integer
    add_column :comments, :object_type, :string
  end
end
