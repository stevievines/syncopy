require 'spec_helper'

describe List do
  let(:user) { FactoryGirl.create(:user) }
  before { @list = user.lists.build(title: 'Top Ten') }

  subject { @list }

  it { should respond_to(:title) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @list.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @list.title = " " }
    it { should_not be_valid }
  end

  describe 'associations' do
    let(:movie) { FactoryGirl.create(:movie) }
    before { @list.list_movies.build(:movie_id => movie.id) }

    describe 'movie methods' do
      it { should respond_to(:movies) }
      its(:movies) { should eq [movie] }
    end
  end
end
