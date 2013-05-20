class Task < ActiveRecord::Base

  attr_accessible :completed, :name

  validates :completed, :inclusion => {:in => [true, false]}

  def self.incomplete
    where(:completed => false)
  end

  def self.complete
    where(:completed => true)
  end
end
