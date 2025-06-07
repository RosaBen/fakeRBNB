class User < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email address please" }

  validates :phone_number,
  presence: true,
  format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }

  # def has_role(role_name)
  #   roles.exists?(name: role_name)
  # end

  def add_role(role_name)
    role = Role.create!(name: role_name)
    roles << role unless roles.include?(role)
  end

  # def remove_role(role_name)
  #   role = roles.find_by(name: role_name)
  #   roles.delete(role) if role
  # end
end
