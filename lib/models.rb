require "mongoid"

class User
  include Mongoid::Document

  field :email, type: String
  field :password, type: String

  def self.create_with_password(email, password)
    create(email: email, password: encrypt_password(password))
  end

  def self.find_login(email, password)
    u = find_by(email: email)
    verify_password(u.password, password) ? u : nil
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end

  def self.encrypt_password(raw_password)
    BCrypt::Password.create(raw_password)
  end

  def self.verify_password(encrypted_password, raw_password)
    BCrypt::Password.new(encrypted_password) == raw_password
  end
end

class Post
  include Mongoid::Document

  field :title, type: String
  field :body, type: String

  has_many :comments
end

class Comment
  include Mongoid::Document

  field :name, type: String
  field :message, type: String

  belongs_to :post
end