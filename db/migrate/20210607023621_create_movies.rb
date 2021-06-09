class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :year
      t.integer :qualification
      t.string :picture

      t.timestamps
    end
  end
end
