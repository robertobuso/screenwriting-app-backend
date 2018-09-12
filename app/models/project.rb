class Project < ApplicationRecord
  has_many :ideas
  has_many :structures

  def self.test(arg)
    arg[0].title = "WHAT?"
    return arg
  end
end
