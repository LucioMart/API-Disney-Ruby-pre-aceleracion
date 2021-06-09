class CreateJoinTableGenresMovies < ActiveRecord::Migration[6.1]
  def change
    create_join_table :genres, :movies, colum_options: {null:false, foreign_key:true} do |t|
      t.index [:genre_id, :movie_id]
      t.index [:movie_id, :genre_id]
    end
  end  
end
