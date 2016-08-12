class Delivery < ActiveRecord::Base

  # ASSOCIATIONS	
  belongs_to :user
  belongs_to :agent, foreign_key: :agent_id, class_name: "User"
end
