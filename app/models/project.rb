class Project < ApplicationRecord
  has_many :ideas
  has_many :structures
end
