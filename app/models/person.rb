class Person < ActiveRecord::Base

  validates :name, :presence => true

  belongs_to :user
  
  has_many :senders
  has_many :recipients
  has_many :received_gifts, :through => :senders
  has_many :sent_gifts, :through => :recipients
end
