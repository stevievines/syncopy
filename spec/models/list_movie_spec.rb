require 'spec_helper'

describe ListMovie do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }
  let(:dark_knight) do
    {
      tmdb_id: 155,
      imdb_id: "tt0468569",
      release_date: Date.parse("2008-07-18"),
      title: "The Dark Knight",
      poster_path: "/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg"
    }
  end

  before { @list_movie = list.list_movies.build(dark_knight) }

  subject { @list_movie }

  it { should respond_to(:title) }
  it { should respond_to(:tmdb_id) }
  it { should respond_to(:imdb_id) }
  it { should respond_to(:release_date) }
  it { should respond_to(:poster_path) }
  it { should respond_to(:list) }
  its(:list) { should eq list }

  it { should be_valid }

  describe "when list_id is not present" do
    before { @list_movie.list_id = nil }
    it { should_not be_valid }
  end

  describe "when tmdb_id is not present" do
    before { @list_movie.tmdb_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @list_movie.title = " " }
    it { should_not be_valid }
  end
end

