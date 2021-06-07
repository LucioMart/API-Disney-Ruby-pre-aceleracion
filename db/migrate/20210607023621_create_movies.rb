class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :gender
      t.integer :qualification
      t.string :picture

      t.timestamps
    end
  end
end
