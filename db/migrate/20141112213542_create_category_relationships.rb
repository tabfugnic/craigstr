class CreateCategoryRelationships < ActiveRecord::Migration
  def change
    create_table :category_relationships do |t|
      t.belongs_to :post, index: true, null: false
      t.belongs_to :category, index: true, null: false

      t.timestamps
    end
  end
end
