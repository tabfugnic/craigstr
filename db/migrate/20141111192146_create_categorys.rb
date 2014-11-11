class CreateCategorys < ActiveRecord::Migration
  def change
    create_table :categorys do |t|
      t.string :name, null: :false
      t.string :description
    end
  end
end
