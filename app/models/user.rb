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

  def twitter
    @twitter ||= Twitter::REST::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret, consumer_key: 'eEsSmiDK5RMwkR5qHqzw', consumer_secret: 'fpk3zV9bUPTOmtoa5gMWEqmo2aTugrlj8STL98IK9Y')
  end

  def self.omniauth_security(params, auth)
    data = auth
    user = User.find_by_id(params)
    user.provider = data['provider']
    user.uid = data['uid']
    user.oauth_token = data['credentials']['token']
    user.oauth_secret = data['credentials']['secret']
    user.save
  end
end
