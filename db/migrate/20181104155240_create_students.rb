class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :number
      t.string :email
      t.string :address
      t.string :city
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
