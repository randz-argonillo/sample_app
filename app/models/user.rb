class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence:true, length: {maximum: 50}
  
  validates :password, presence:true, length: {minimum: 6}
  validates :password_confirmation, presence:true
  
  valid_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true , format: {with:valid_format}, uniqueness: {case_sensitive:false}
  
  before_save {|user| user.email.downcase!}
  has_secure_password
end
