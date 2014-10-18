require 'spec_helper'

describe "User model" do
  
  before{@user = User.new(name:"user1", email:"user1@email.com")}
  subject {@user}
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should be_valid}
  
  describe "User too long" do
    before {@user.name = 'a' * 51}
    
    it {should_not be_valid}
  end


  describe "when email format is invalid" do
    it "should be invalid" do
      invalid_emails = %w[user@foo com user.com foo@bar+bz.com]
      
      invalid_emails.each do |invalid_email|
        @user.email = invalid_email
        should_not be_valid
      end
    end 
    
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      valid_emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn asdf+@yahoo.com]
      valid_emails.each do |valid_email|
        email = valid_email
        should be_valid
      end
    end
  end


end


