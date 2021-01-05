class Pet < ActiveRecord::Base
  validates_presence_of :name, :age, :breed, :weight

end

