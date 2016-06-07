class SentGift < ActiveRecord::Base
  validates :date, :presence => true
  validates :content, :presence => true

  belongs_to :user

  has_many :recipients
  has_many :persons, :through => :recipients
end
