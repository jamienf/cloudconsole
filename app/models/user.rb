class User < ActiveRecord::Base
  has_many :band_members
  has_many :bands, through: :band_members

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
