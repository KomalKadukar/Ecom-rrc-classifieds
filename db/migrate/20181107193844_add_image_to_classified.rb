class AddImageToClassified < ActiveRecord::Migration[5.2]
  def change
    add_column :classifieds, :image, :string
  end
end
