class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  acts_as_voter
  has_karma :posts, :as => :submitter, :weight => [1, 0.5]
  has_karma :comments, :as => :submitter, :weight => [1, 0.5]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username

  def self.voted_on?(object)
    if self.voted_for?(object) || self.voted_against?(object)
      true
    else
      false
    end
  end
end
