class CreateOrderClassifieds < ActiveRecord::Migration[5.2]
  def change
    create_table :order_classifieds do |t|
      t.references :order, foreign_key: true
      t.references :classified, foreign_key: true

      t.timestamps
    end
  end
end
