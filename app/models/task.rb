class Task < ActiveRecord::Base
  attr_accessible :completed, :name

  def self.incomplete
    where(:completed => false)
  end
end
