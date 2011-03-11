Factory.define :user do |user|
  user.add_attribute :name, "TestUser"
  user.add_attribute :email, "test@user.de"
  user.add_attribute :password, "12345"
  user.add_attribute :password_confirmation, "12345"
end