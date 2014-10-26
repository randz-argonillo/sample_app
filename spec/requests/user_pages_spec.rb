require 'spec_helper'

describe "UserPages" do
  
  subject {page}
  
  describe "Signup" do
    before { visit new_user_path }
    
    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up')}
    
    #before {visit signup_path}
    let(:submit){"Create my account"}
    
    describe "with invalid information" do 
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count) 
      end
    end
    
    describe "with valid information" do
      it "should create a user" do
        fill_in "Name", with:"randy"
        fill_in "Email", with:"randy.argonillo@traxtech.com"
        fill_in "Password", with:"test"
        fill_in "Confirmation", with:"test"
      
        expect {click_button submit}.to change(User, :count).by(1)
      end
    
    end

  end
  
  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before {visit user_path(user)}
    
    it {should have_selector('h1', text: user.name)}
    it {should have_selector('title', text:user.name)}
  end
end
