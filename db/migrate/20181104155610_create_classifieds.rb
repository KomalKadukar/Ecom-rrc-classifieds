class CreateClassifieds < ActiveRecord::Migration[5.2]
  def change
    create_table :classifieds do |t|
      t.string :item
      t.decimal :price
      t.string :description
      t.references :category, foreign_key: true
      t.references :student, foreign_key: true
      t.boolean :admin_ad
      t.boolean :sold

      t.timestamps
    end
  end
end
