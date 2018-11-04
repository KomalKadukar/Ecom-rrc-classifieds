class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :code
      t.string :rate_type
      t.decimal :province_rate
      t.decimal :canada_rate

      t.timestamps
    end
  end
end
