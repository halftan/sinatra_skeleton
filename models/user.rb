require 'mongoid'
require 'bcrypt'

class User
  include Mongoid::Document

  field :username,        type: String
  field :email,           type: String
  field :password_hash,   type: String

  attr_protected          :password_hash

  validates_presence_of   :email, message: "Email is required."
  validates_uniqueness_of :email, message: "Email already in use."
  validates_format_of     :email, with: /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i,
                                  message: "Please enter a valid email address"
  validates_presence_of   :password_hash

  def password=(password)
    bcry_pass = BCrypt::Password.create password
    self.password_hash = bcry_pass.to_s
  end

  def password
    BCrypt::Password.new self.password_hash
  end

  def self.authenticate opt={}
    begin
      user = nil
      %i(email id).each do |key|
        if opt[key]
          user = unscoped.find_by key => opt[key]
          break
        end
      end
      if user.password == opt[:password]
        return user
      else
        return nil
      end
    rescue Mongoid::Errors::DocumentNotFound
      return nil
    rescue
      return nil
    end
  end

end
