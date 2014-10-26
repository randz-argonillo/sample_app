class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence:true, length: {maximum: 50}
  
  validates :password, presence:true, length: {minimum: 6}
  validates :password_confirmation, presence:true
  
  valid_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true , format: {with:valid_format}, uniqueness: {case_sensitive:false}
  
  before_save {|user| user.email.downcase!}
  before_save :create_remember_token
  has_secure_password
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
  private :create_remember_token
end
