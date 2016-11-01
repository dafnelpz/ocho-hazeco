class UserBag < ActiveRecord::Base

  # ASSOCIATIONS
  belongs_to :user
  belongs_to :agent, foreign_key: :agent_id, class_name: "User"
  belongs_to :bag
  belongs_to :delivery

  # VALIDATIONS
  # validates :kg, :bag_id, presence: true
end
