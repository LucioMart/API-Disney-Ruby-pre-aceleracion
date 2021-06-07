class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.int :gender
      t.int :qualification
      t.string :picture
      t.character :references

      t.timestamps
    end
  end
end
