require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should contain 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
    
      visit "/static_pages/home"
      page.should have_content("Sample App")
    end
  end
  
  describe "Help page" do
    it "should contain 'Help'" do
      visit "/static_pages/help"
      page.should have_content("Help")
    end
  end
  
  describe "About page" do
    it "should contain 'About Us'" do
      visit "/static_pages/about"
      page.should have_content("About Us")
    end
  end
end


