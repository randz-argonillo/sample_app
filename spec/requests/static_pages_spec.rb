require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the h1 'Welcome to the Sample App'" do
    
      visit '/'
      page.should have_selector('h1',:text => 'Welcome to the Sample App')
    end
    
    it "should have the title 'Home'" do
      visit '/'
      page.should have_selector('title', :text => 'Home')
    end
    
  end
  

  
  
  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/help'
      page.should have_selector('h1', :text => 'Help')
    end
    
    it "should have the title 'Sample App | Help'" do
      visit '/help'
      page.should have_selector('title', :text => 'Help')
    end
    
  end
  
  describe "About page" do
    it "should have the h1 'About Us'" do
      visit "about"
      page.should have_selector('h1', :text => 'About Us')
    end
    
    
    it "should have the title 'Sample App | About Us'" do
      visit "/about"
      page.should have_selector('title', :text => 'About Us')
    end
  end
end


