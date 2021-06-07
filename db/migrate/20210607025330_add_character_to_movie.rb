class AddCharacterToMovie < ActiveRecord::Migration[6.1]
  def change
    add_reference :movies, :character, null: false, foreign_key: true
  end
end