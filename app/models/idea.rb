class Idea < ApplicationRecord
  belongs_to :project

  def self.plus_plus(arg)
    arg.select { |scene| scene.begins == "+" && scene.ends == "+" }
  end

  def self.plus_double_plus(arg)
    arg.select { |scene| scene.begins == "+" && scene.ends == "++" }
  end

  def self.plus_triple_plus(arg)
    arg.select { |scene| scene.begins == "+" && scene.ends == "+++" }
  end

  def self.plus_minus(arg)
    arg.select { |scene| scene.begins == "+" && scene.ends == "-" }
  end

  def self.plus_double_minus(arg)
    arg.select { |scene| scene.begins == "+" && scene.ends == "- -" }
  end

  def self.plus_triple_minus(arg)
    arg.select { |scene| scene.begins == "+" && scene.ends == "- - -" }
  end

  def self.minus_plus(arg)
    arg.select { |scene| scene.begins == "-" && scene.ends == "+" }
  end

  def self.minus_double_plus(arg)
    arg.select { |scene| scene.begins == "-" && scene.ends == "++" }
  end

  def self.minus_triple_plus(arg)
    arg.select { |scene| scene.begins == "-" && scene.ends == "+++" }
  end

  def self.minus_minus(arg)
    arg.select { |scene| scene.begins == "-" && scene.ends == "-" }
  end

  def self.minus_double_minus(arg)
    arg.select { |scene| scene.begins == "-" && scene.ends == "- -" }
  end

  def self.minus_triple_minus(arg)
    arg.select { |scene| scene.begins == "-" && scene.ends == "- - -" }
  end

end
