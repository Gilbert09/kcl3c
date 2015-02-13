class User < ActiveRecord::Base
  has_many :properties, inverse_of: :user
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
		 :confirmable
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :mobile_number, presence: true
	validates :home_number, presence: true
	validates :title, presence: true
end
