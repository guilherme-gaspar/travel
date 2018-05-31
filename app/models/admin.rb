class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "160x160>", small: "25x25>" }, default_url: "/images/:style/missing.jpeg"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 has_many :contracts
 has_many :users
 has_many :drivers
 has_many :fast_travels
 has_many :notifications
 has_many :universities
 has_many :routes

end
