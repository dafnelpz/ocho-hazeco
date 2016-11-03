class Delivery < ActiveRecord::Base

  # ASSOCIATIONS	
  belongs_to :user
  belongs_to :agent, foreign_key: :agent_id, class_name: "User"
  has_many :user_bags, dependent: :destroy, inverse_of: :delivery
  accepts_nested_attributes_for :user_bags, reject_if: :blank_bag?

  # CALLBACKS
  # after_initialize :initialize_user_bags, if: :new_record?

  # METHODS
  def initialize_user_bags
      Bag.all.each do |bag|
        user_bags.build(bag_id: bag.id)
      end
  end

  protected

  def blank_bag?(att)
    att['kg'].blank? || att['bag_id'].blank?
  end
end
