# == Schema Information
# Schema version: 20110310205218
#
# Table name: users
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  email         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  password_hash :string(255)
#  password_salt :string(255)
#  is_admin      :boolean
#

# quellenhinweis: die meisten validations von railscasts. auth code lose von railscasts

class User < ActiveRecord::Base
  has_many :dish_ratings, class_name: "Rating"
  has_one :layout_option

  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  before_save :encrypt_password

  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_format_of :name, with: /^[-\w\._@]+$/i, message: "Sollte nur Buchstaben, Zahlen oder .-_@ enthalten"
  validates_format_of :email, with: /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_length_of :password, minimum: 4, allow_blank: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
