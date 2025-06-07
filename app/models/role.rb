class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  if Role.table_exists? and Role.name == "host"

  end
end
