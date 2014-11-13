class PostTitleToName < ActiveRecord::Migration
  def change
    remove_column :posts, :title
    add_column :posts, :name, :string, null: false
    change_column_null :posts, :user_id, false
  end
end
