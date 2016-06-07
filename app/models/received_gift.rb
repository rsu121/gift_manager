class ReceivedGift < ActiveRecord::Base
  validates :date, :presence => true
  validates :content, :presence => true

  belongs_to :user

  has_many :senders
  has_many :persons, :through => :senders
end
