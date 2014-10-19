require 'spec_helper'

describe "User model" do
  
  before{@user = User.new(name:"user1", email:"user1@email.com", password:"pwd123", password_confirmation:"pwd123")}
  subject {@user}
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:authenticate)}
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
        @user.email = valid_email
        @user.should be_valid
      end
    end
  end
  
  describe "when email is already taken" do
    before do
      duplicate_user = @user.dup
      duplicate_user.email.upcase!
      duplicate_user.save
    end
    
    it "should be invalid" do 
      should_not be_valid
    end
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " } 
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before {@user.password_confirmation = "foo"}
    it {should_not be_valid}
  end

  describe "when password confirmation is nil" do
    before {@user.password_confirmation = nil}
    it{should_not be_valid}
  end
  
  #describe "when password is less than 6 characters" do
  #  before {@user.password = "a" * 5}
  #  it{should be_invalid}
  #end
  
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 } 
    it { @user.should be_invalid }
  end

#@user.password_confirmation = 
end


