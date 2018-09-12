class Structure < ApplicationRecord
  belongs_to :project

  def order
    self.order_of_ideas.map do |scene|
      scene.to_i
    end
  end

##Divide scenes by marked acts
  def self.create_acts
    @all_scenes = Idea.all.to_a
    @total_scenes = Idea.all.length

    @act_one_scenes = []
    @act_two_scenes = []
    @act_three_scenes = []
    @act_four_scenes = []

    idx = 0
    counter = 0
    until @all_scenes.length == 0 || idx > @all_scenes.length - 1 do
      if !@all_scenes[idx]["act"].nil?
        case @all_scenes[idx]["act"]
          when 1
            @act_one_scenes << @all_scenes[idx]
            @all_scenes.delete(@all_scenes[idx])
          when 2
            @act_two_scenes << @all_scenes[idx]
            @all_scenes.delete(@all_scenes[idx])
          when 3
            @act_three_scenes << @all_scenes[idx]
            @all_scenes.delete(@all_scenes[idx])
          when 4
            @act_four_scenes << @all_scenes[idx]
            @all_scenes.delete(@all_scenes[idx])
          else
            idx = idx + 1
        end
      else
        idx = idx + 1
      end
    end
  self.find_turns
  end

##Divide scenes by turns
  def self.find_turns
   @all_scenes.each do |scene|
      if scene.turn == "Inciting Incident" || scene.turn == "Break Into Two"
        @act_one_scenes << scene
        @all_scenes.delete(scene)
      elsif scene.turn == "Midpoint"
        @act_two_scenes << scene
        @all_scenes.delete(scene)
      elsif scene.turn == "Break Into Three" || scene.turn == "Crisis Decision"
        @act_three_scenes << scene
        @all_scenes.delete(scene)
      elsif scene.turn == "Denouement"
        @act_four_scenes <<scene
        @all_scenes.delete(scene)
      end
    end
    self.find_by_arc
  end

##Divide scenes by scene-arc
  def self.find_by_arc
    if !Idea.plus_plus(@all_scenes).nil?
      @act_one_scenes << Idea.plus_plus(@all_scenes)
      @all_scenes.delete(Idea.plus_plus(@all_scenes))
    end
    if !Idea.minus_minus(@all_scenes).nil?
      @act_one_scenes << Idea.minus_minus(@all_scenes)
      @all_scenes.delete(Idea.minus_minus(@all_scenes))
    end
    if !Idea.minus_plus(@all_scenes).nil?
      @act_one_scenes << Idea.minus_plus(@all_scenes)
      @all_scenes.delete(Idea.minus_plus(@all_scenes))
    end
    if !Idea.plus_triple_plus(@all_scenes).nil?
      @act_three_scenes << Idea.plus_triple_plus(@all_scenes)
      @all_scenes.delete(Idea.plus_triple_plus(@all_scenes))
    end
    if !Idea.plus_triple_minus(@all_scenes).nil?
      @act_three_scenes << Idea.plus_triple_minus(@all_scenes)
      @all_scenes.delete(Idea.plus_triple_minus(@all_scenes))
    end
    if !Idea.minus_triple_plus(@all_scenes).nil?
      @act_three_scenes << Idea.minus_triple_plus(@all_scenes)
      @all_scenes.delete(Idea.minus_triple_plus(@all_scenes))
    end
    if !Idea.minus_triple_minus(@all_scenes).nil?
      @act_three_scenes << Idea.minus_triple_minus(@all_scenes)
      @all_scenes.delete(Idea.minus_triple_minus(@all_scenes))
    end
      @act_two_scenes << @all_scenes

    @act_one_scenes = @act_one_scenes.uniq
    @act_two_scenes = @act_two_scenes.uniq
    @act_three_scenes = @act_three_scenes.uniq
    @act_four_scenes = @act_four_scenes.uniq

    self.i_am_here
  end

  def self.i_am_here
    puts "WE NEED TO KEEP WORKING! But we're finally getting close to that mvp."
    # organize_act_one???
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

##Acts by Length
  def act_one
    @all_scenes[0..(@total_scenes * 0.2)-1]
  end

  def act_two
    @all_scenes[(@total_scenes * 0.2)..self.midpoint-1]
  end

  def act_three
    @all_scenes[(self.midpoint)..(self.midpoint + @total_scenes * 0.3)]
  end

  def act_four
    @all_scenes[((@total_scenes*0.8)+1..@total_scenes-1)]
  end


  private

  def midpoint
  ((@total_scenes * 0.5)).ceil
  end
end
