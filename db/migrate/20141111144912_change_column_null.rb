class ChangeColumnNull < ActiveRecord::Migration
  def change
    change_column_null :posts, :title, false
  end
end
