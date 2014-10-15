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

end
