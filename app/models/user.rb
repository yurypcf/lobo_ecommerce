class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :document_number, presence: true

  enum role: { customer: 'customer', admin: 'admin', stockist: 'stockist' }

  before_create do
    cpf = CPF.new(document_number)

    self.document_number = cpf.formatted
  end
end
