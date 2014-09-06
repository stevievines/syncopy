require 'spec_helper'

describe "List pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "list creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a list" do
        expect { click_button "new list" }.not_to change(List, :count)
      end

      describe "error messages" do
        before { click_button "#listForm" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'list_title', with: "KP is awesome"
      end

      it "should create a list" do
        expect { click_button "+ Add List" }.to change(List, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:list, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a list" do
        expect { click_link "delete" }.to change(List, :count).by(-1)
      end
    end
  end
end
