class CreateProgramClassifieds < ActiveRecord::Migration[5.2]
  def change
    create_table :program_classifieds do |t|
      t.references :program, foreign_key: true
      t.references :classified, foreign_key: true

      t.timestamps
    end
  end
end
