# == Schema Information
# Schema version: 20110310205218
#
# Table name: users
class User < ActiveRecord::Base
  has_many :dish_ratings, class_name: "Rating"
  has_one :layout_option

  devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable, :pepper => '' #, :confirmable, :recoverable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end
