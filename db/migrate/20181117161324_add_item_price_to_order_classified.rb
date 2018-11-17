class AddItemPriceToOrderClassified < ActiveRecord::Migration[5.2]
  def change
    add_column :order_classifieds, :item_price, :decimal
  end
end
