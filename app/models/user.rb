class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, through: :attendances
  has_many :attendances, foreign_key: "attendee_id"
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"

  has_many :locations, as: :addressable
  accepts_nested_attributes_for :locations
  
  validates :first_name, presence: true
  
  include ActsAsFriendable

  

  def name
    "#{first_name} #{last_name}"
  end
end
