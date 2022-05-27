class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :type_customer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :lockable


  def is_admin?
    self.type == "Admin"
  end


  def type_customer
    self.type = "Customer" if self.type.blank?
  end
end
