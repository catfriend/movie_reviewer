class AddSomeFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :writer, :string
    add_column :movies, :producer, :string
  end
end
