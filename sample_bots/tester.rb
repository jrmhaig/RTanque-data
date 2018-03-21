# Tester: Shoots 5 rounds
#
# Enjoys sitting in the corners and firing powerful shots
class Camper < RTanque::Bot::Brain
  NAME = 'Tester'
  include RTanque::Bot::BrainHelper

  TURRET_FIRE_RANGE = RTanque::Heading::ONE_DEGREE * 1.0

  def tick!
    self.command.fire(MIN_FIRE_POWER)
  end

#  def fire_upon(target)
#    self.command.radar_heading = target.heading
#    self.command.turret_heading = target.heading
#    if self.sensors.turret_heading.delta(target.heading).abs < TURRET_FIRE_RANGE
#      self.command.fire(MAX_FIRE_POWER)
#    end
#  end
#
#  def nearest_target
#    self.sensors.radar.min { |a,b| a.distance <=> b.distance }
#  end
#
#  def detect_targets
#    self.command.radar_heading = self.sensors.radar_heading + MAX_RADAR_ROTATION
#    self.command.turret_heading = self.sensors.heading + RTanque::Heading::HALF_ANGLE
#  end
#
#  def hide_in_corners
#    @corner_cycle ||= CORNERS.shuffle.cycle
#    self.at_tick_interval(self.camp_interval) {
#      self.corner = @corner_cycle.next
#      self.reset_camp_interval
#    }
#    self.corner ||= @corner_cycle.next
#    self.move_to_corner
#  end
#
#  def move_to_corner
#    if self.corner
#      command.heading = self.sensors.position.heading(RTanque::Point.new(*self.corner, self.arena))
#      command.speed = MAX_BOT_SPEED
#    end
#  end
#
#  def corner=(corner_name)
#    @corner = case corner_name
#      when :NE
#        [self.arena.width, self.arena.height]
#      when :SE
#        [self.arena.width, 0]
#      when :SW
#        [0, 0]
#      else
#        [0, self.arena.height]
#    end
#  end
#
#  def corner
#    @corner
#  end
#
#  def camp_interval
#    @camp_interval ||= self.reset_camp_interval
#  end
#
#  def reset_camp_interval
#    @camp_interval = rand(SWITCH_CORNER_TICK_RANGE.max - SWITCH_CORNER_TICK_RANGE.min) + SWITCH_CORNER_TICK_RANGE.min
#  end
end