class Idea < ApplicationRecord
  belongs_to :project

##Logic for selecting scene ideas by their conflict arcs
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

  ##Attributes to Organize Search Functionality
  # def self.show_by(attr, arg)
  #   arg.select { |scene| !scene."#{attr}".nil?}
  # end
  #
  def self.show_research(arg)
    arg.select { |scene| !scene.research.empty?}
  end

  def self.show_inspiration(arg)
    arg.select { |scene| !scene.inspiration.empty?}
  end

  def self.show_description(arg)
    arg.select { |scene| !scene.description.nil?}
  end

  def self.show_conflict(arg)
    arg.select { |scene| !scene.conflict.nil?}
  end

  def self.show_miscellaneous(arg)
    arg.select { |scene| !scene.miscellaneous.nil?}
  end

  ##Acts by Length
    def self.act_one(arg)
      arg[0..(arg.length * 0.2)-1]
    end

    def self.act_two(arg)
      arg[(arg.length * 0.2)..((arg.length * 0.5).ceil) - 1]
    end

    def self.act_three(arg)
      arg[(((arg.length * 0.5).ceil))..(((arg.length * 0.5).ceil) + arg.length * 0.3)]
    end

    def self.act_four(arg)
      arg[((arg.length*0.8)+1..arg.length-1)]
    end

end
