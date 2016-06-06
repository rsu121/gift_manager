class Recipient < ActiveRecord::Base
  validates :person_id, :presence => true
  validates :sent_gift_id, :presence => true

  belongs_to :sent_gift
  belongs_to :person
end
