class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :document_number, presence: true

  enum role: { customer: 'customer', admin: 'admin', stockist: 'stockist' }
end
