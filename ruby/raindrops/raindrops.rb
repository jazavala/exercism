class Raindrops

  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze


  # Converts the drip into sound.
  #
  # @param drip [Integer]
  # @example Returns the all sounds
  #  "Raindrops.convert(105)" #=> "PlingPlangPlong"
  # @example Returns the drip as string when the drip does not exist
  #  "Raindrops.convert(1)" #=> "1"
  # @return [String] the object converted into the expected format.
  #   drip is searched in the Rules if it exist return the sound
  #   but if it does not exist return same drip in string
  def self.convert(drip)
    new(drip).to_s
  end

private

  attr_reader :drip, :rules

  def initialize(drip, rules = RULES)
    @drip = drip
    @rules = rules
  end

  def raindrop_speak
    rules.each_with_object(noise = '') do |(factor, sound), noise|
      noise << sound if (drip % factor).zero?
    end
  end

  def sound(noise)
    noise.empty? ? drip.to_s : noise
  end

public

  def to_s
    sound(raindrop_speak)
  end
end
