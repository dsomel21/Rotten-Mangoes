class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :runtime_in_minutes
      t.text :description
      t.string :poster_image_url
      t.date :release_date

      t.timestamps null: false
    end
  end
end
