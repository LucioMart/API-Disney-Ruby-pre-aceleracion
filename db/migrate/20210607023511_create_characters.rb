class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.date :year
      t.float :weigh
      t.text :story
      t.string :picture

      t.timestamps
    end
  end
end
