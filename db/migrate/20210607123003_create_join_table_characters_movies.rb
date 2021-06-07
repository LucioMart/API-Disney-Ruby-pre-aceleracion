class CreateJoinTableCharactersMovies < ActiveRecord::Migration[6.1]
  def change
    create_join_table :characters, :movies, colum_options: {null:false, foreign_key:true} do |t|
      t.index [:character_id, :movie_id]
      t.index [:movie_id, :character_id]
    end
  end
end
