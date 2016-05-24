class AddNameAndDirectorToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :name, :string
    add_column :movies, :director, :string
  end
end
