class PostTitleToName < ActiveRecord::Migration
  def change
    rename_column :posts, :title, :name
    change_column_null :posts, :user_id, false
  end
end
