require 'spec_helper'

describe "Viewing an individual movie" do  
  it "shows the movie's details" do
    movie = Movie.create(movie_attributes)

	visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.writer)
    expect(page).to have_text(movie.producer)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
  end

  it "shows the total gross if the total gross exceeds $25M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000))

    visit movie_url(movie)

    expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Bomb!' if the total gross is less than $25M" do
    movie = Movie.create(movie_attributes(total_gross: 40000000))

    visit movie_url(movie)

    expect(page).to have_text("Bomb!")
  end

  it "has an SEO-friendly URL" do
  movie = Movie.create!(movie_attributes(title: "X-Men: The Last Stand"))

  visit movie_url(movie)

  expect(current_path).to eq("/movies/x-men-the-last-stand")
end
  
end