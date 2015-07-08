require 'spec_helper'

describe ListMovie do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }
  let(:movie) { FactoryGirl.create(:movie) }
  let(:list_movie) { list.list_movies.build(:movie_id => movie.id) }

  subject { list_movie }

  it { should be_valid }

  describe 'movie methods' do
    it { should respond_to(:movie) }
    its(:movie) { should eq movie }
  end

  describe 'list_methods' do
    it { should respond_to(:list) }
    its(:list) { should eq list }
  end

  describe "when list_id is not present" do
    before { list_movie.list_id = nil }
    it { should_not be_valid }
  end

  describe "when movie_id is not present" do
    before { list_movie.movie_id = nil }
    it { should_not be_valid }
  end
end

