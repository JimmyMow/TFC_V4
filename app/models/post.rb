class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: [:update, :destroy], owner: ->(controller, model) {controller && controller.current_user}

  has_many :comments
  belongs_to :user
  acts_as_voteable
end
