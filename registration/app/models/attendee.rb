class Attendee < ActiveRecord::Base
  belongs_to :event

  validates :agewaiver, :acceptance => true

  validates :username,
    :presence => true,
    :length => {:minimum => 3, :maximum => 256},
    :uniqueness => true

  validates :realname,
    :presence => true,
    :length => {:minimum => 3, :maximum => 256}

  validates :email,
    :presence => true,
    :length => {:minimum => 3, :maximum => 256},
    :uniqueness => true,
    :email => true,
    :confirmation => true

  validates :emergency_info,
    :presence => true,
    :length => {:minimum => 3, :maximum => 360}

  validates :price,
    :presence => true,
    :numericality => {:greater_than_or_equal_to => 0, :less_than => 100}

  validates :amount,
    :numericality => {:greater_than_or_equal_to => 0, :less_than => 100}

  validates :fee,
    :numericality => {:greater_than_or_equal_to => 0, :less_than => 100}

  validates :datenight,
    :presence => true,
    :inclusion => {:in => %w(mandate damedate none), :message => "%{value} is not a date option" }

  validates_presence_of :email_confirmation, :if => :email_changed?

end
