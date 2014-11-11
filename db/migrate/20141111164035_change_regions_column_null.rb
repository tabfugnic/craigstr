class ChangeRegionsColumnNull < ActiveRecord::Migration
  def change
    change_column_null :regions, :name, false
  end
end
