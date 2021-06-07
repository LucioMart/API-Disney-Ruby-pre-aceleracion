class AddMovieToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_reference :characters, :movies, null: false, foreign_key: true
  end
end
