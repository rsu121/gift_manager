class Sender < ActiveRecord::Base
  validates :person_id, :presence => true
  validates :received_gift_id, :presence => true
  
  belongs_to :user

  belongs_to :received_gift
  belongs_to :person
end
