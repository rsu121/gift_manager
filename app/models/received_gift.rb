class ReceivedGift < ActiveRecord::Base
  validates :date, :presence => true

  has_many :senders
  has_many :persons, :through => :senders
end
