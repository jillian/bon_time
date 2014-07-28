class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :attendances

  validates :first_name, presence: true
  
  include ActsAsFriendable

  has_many :locations, as: :addressable
  accepts_nested_attributes_for :locations

  def name
    "#{first_name} #{last_name}"
  end
end
