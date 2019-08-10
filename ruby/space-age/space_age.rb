class SpaceAge
  attr_reader :seconds

  EARTH_ORBIT_PERIOD = 31557600.0

  ORBITAL_PERIODS = {
    earth: 1.0,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
  }

  CALCULATE_ORBITAL = ->(orbital, seconds) { seconds / (ORBITAL_PERIODS[orbital] * EARTH_ORBIT_PERIOD) }

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(method_name, *args, &block)
    method_name.to_s.include?('on_') && CALCULATE_ORBITAL.call(method_name.slice(3..-1).to_sym, self.seconds) || super
  end

  def respond_to_missing?(method_name, include_private = false)
    ORBITAL_PERIODS.key?(method_name.slice(3..-1)&.to_sym) || super
  end

  # Define all's keys as method's
  # ORBITAL_PERIODS.keys.each do |orbital|
  #   define_method("on_#{orbital}") do
  #     @seconds / (ORBITAL_PERIODS[orbital] * EARTH_ORBIT_PERIOD)
  #   end
  # end
end
