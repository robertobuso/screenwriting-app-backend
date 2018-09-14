class Structure < ApplicationRecord
  belongs_to :project

##Convert hash into array of Idea objects
  def self.generate_array(structure_hash)
    all_scenes = []
    structure_hash.each do |arr|
      arr.each do |key, value|
        if (Idea.find(value).inspiration.nil? || Idea.find(value).inspiration.empty?) && (Idea.find(value).research.nil? || Idea.find(value).research.empty?)
          all_scenes << Idea.find(value)
        end
      end
    end
    self.create_acts(all_scenes)
  end

##Divide scenes by marked acts
  def self.create_acts(all_scenes)
    @total_scenes = Idea.all.length

    @act_one_scenes = []
    @act_two_scenes = []
    @act_three_scenes = []
    @act_four_scenes = []

    idx = 0
    counter = 0
    until all_scenes.length == 0 || idx > all_scenes.length - 1 do
      if !all_scenes[idx]["act"].nil?
        case all_scenes[idx]["act"]
          when 1
            @act_one_scenes << all_scenes[idx]
            all_scenes.delete(all_scenes[idx])
          when 2
            @act_two_scenes << all_scenes[idx]
            all_scenes.delete(all_scenes[idx])
          when 3
            @act_three_scenes << all_scenes[idx]
            all_scenes.delete(all_scenes[idx])
          when 4
            @act_four_scenes << all_scenes[idx]
            all_scenes.delete(all_scenes[idx])
          else
            idx = idx + 1
        end
      else
        idx = idx + 1
      end
    end
  self.find_turns(all_scenes)
  end

##Divide scenes by turns
  def self.find_turns(all_scenes)
   all_scenes.each do |scene|
      if scene.turn == "Inciting Incident" || scene.turn == "Break Into Two"
        @act_one_scenes << scene
        all_scenes.delete(scene)
      elsif scene.turn == "Midpoint"
        @act_two_scenes << scene
        all_scenes.delete(scene)
      elsif scene.turn == "Break Into Three" || scene.turn == "Crisis Decision"
        @act_three_scenes << scene
        all_scenes.delete(scene)
      elsif scene.turn == "Denouement"
        @act_four_scenes <<scene
        all_scenes.delete(scene)
      end
    end
    self.find_by_arc(all_scenes)
  end

##Divide scenes by scene-arc
  def self.find_by_arc(all_scenes)
    if !Idea.plus_plus(all_scenes).nil?
      @act_one_scenes << Idea.plus_plus(all_scenes)
      all_scenes.delete(Idea.plus_plus(all_scenes))
    end
    if !Idea.minus_minus(all_scenes).nil?
      @act_one_scenes << Idea.minus_minus(all_scenes)
      all_scenes.delete(Idea.minus_minus(all_scenes))
    end
    if !Idea.minus_plus(all_scenes).nil?
      @act_one_scenes << Idea.minus_plus(all_scenes)
      all_scenes.delete(Idea.minus_plus(all_scenes))
    end
    if !Idea.plus_triple_plus(all_scenes).nil?
      @act_three_scenes << Idea.plus_triple_plus(all_scenes)
      all_scenes.delete(Idea.plus_triple_plus(all_scenes))
    end
    if !Idea.plus_triple_minus(all_scenes).nil?
      @act_three_scenes << Idea.plus_triple_minus(all_scenes)
      all_scenes.delete(Idea.plus_triple_minus(all_scenes))
    end
    if !Idea.minus_triple_plus(all_scenes).nil?
      @act_three_scenes << Idea.minus_triple_plus(all_scenes)
      all_scenes.delete(Idea.minus_triple_plus(all_scenes))
    end
    if !Idea.minus_triple_minus(all_scenes).nil?
      @act_three_scenes << Idea.minus_triple_minus(all_scenes)
      all_scenes.delete(Idea.minus_triple_minus(all_scenes))
    end
      @act_two_scenes << all_scenes

    @act_one_scenes = @act_one_scenes.uniq
    @act_two_scenes = @act_two_scenes.uniq
    @act_three_scenes = @act_three_scenes.uniq
    @act_four_scenes = @act_four_scenes.uniq

    self.i_am_here
  end

  def self.i_am_here
    final_array = @act_one_scenes + @act_two_scenes + @act_three_scenes + @act_four_scenes

    new_structure = final_array.flatten.uniq.map do |scene|
      scene.id
    end

    self.create_hash(new_structure)
  end

  def self.create_hash(new_structure)
    @returned_array = []
    div_id = 1

    new_structure.each do |id|
      @returned_array << { div_id => id }
      div_id = div_id + 1
    end

    return @returned_array
  end

  def organize_act_one
    # @final_act_one = [(Idea.plus_plus(@act_one_scenes)) + (Idea.plus_minus(@act_one_scenes)) + (Idea.minus_plus(@act_one_scenes)) + INCITING INCIDENT? MORE SCENES? BREAK INTO TWO???
  end

  def organize_act_two
  end

  def organize_act_three
  end

  def organize_act_four
  end
end
