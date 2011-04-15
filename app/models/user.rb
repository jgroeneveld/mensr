# == Schema Information
# Schema version: 20110315162444
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  email                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  encrypted_password   :string(255)
#  password_salt        :string(255)
#  admin                :boolean
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  failed_attempts      :integer         default(0)
#  unlock_token         :string(255)
#  locked_at            :datetime
#  authentication_token :string(255)
#

# == Schema Information
# Schema version: 20110310205218
#
# Table name: users
class User < ActiveRecord::Base
  has_many :dish_ratings, class_name: "Rating", dependent: :destroy
  has_one :layout_option, dependent: :destroy
  has_many :actions, dependent: :destroy

  devise :database_authenticatable, :rememberable, :recoverable, :trackable, :validatable, :registerable, :pepper => '' #, :confirmable,

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end
