class SentGift < ActiveRecord::Base
      validates :date, :presence => true

      has_many :recipients
      has_many :persons, :through => :recipients
end
