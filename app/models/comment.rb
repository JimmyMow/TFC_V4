class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked except: [:update, :destroy], owner: ->(controller, model) {controller && controller.current_user}
  tracked except: [:update, :destroy], recipient: ->(controller, model) { model && model.post }

  belongs_to :user
  belongs_to :post
  acts_as_voteable
end
