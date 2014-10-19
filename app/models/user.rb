class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, presence:true, length: {maximum: 50}
  
  valid_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true , format: {with:valid_format}, uniqueness: {case_sensitive:false}
  
  before_save {|user| user.email.downcase!}
end
