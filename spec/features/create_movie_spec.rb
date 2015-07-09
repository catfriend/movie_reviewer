require 'spec_helper'

describe "Creating a new movie" do
  it "saves the movie and shows the new movie's details" do
    visit movies_url

    click_link 'Add New Movie'

    expect(current_path).to eq(new_movie_path)

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "Superheroes saving the world from villains"
    fill_in "Rating", with: "PG-13"
    fill_in "Total gross", with: "75000000"
    select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in "Cast", with: "Cast"
    fill_in "Director", with: "Director"
    fill_in "Written by", with: "Written by"
    fill_in "Produced by", with: "Produced by"
    fill_in "Duration", with: "123 minutes"
    fill_in "Image file name", with: "movie.png"

    click_button 'Create Movie'

    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Movie Title')
  end

  it "does not save the movie if it's invalid" do
  visit new_movie_url
  
  expect { 
    click_button 'Create Movie' 
  }.not_to change(Movie, :count)
  
  expect(current_path).to eq(movies_path)   
  expect(page).to have_text('error')
  expect(page).to have_text('Movie successfully created!')

end

end