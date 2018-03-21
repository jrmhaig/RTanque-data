module RTanque
  class Data
    def initialize match
      @match = match
    end

    def run
      @match_data = []
      while !@match.finished?
        @match.tick
        @match_data << {
          bots: @match.bots.map do |bot|
                    {
                      name: bot.name,
                      x: bot.position.x,
                      y: bot.position.y,
                      health: bot.health,
                      heading: bot.heading.to_degrees.to_f,
                      turret: bot.turret.heading.to_degrees.to_f,
                      radar: bot.radar.heading.to_degrees.to_f
                    }
                  end,
          shells: @match.shells.map do |shell|
                    { x: shell.position.x, y: shell.position.y }
                  end
        }
      end
      @match_data
    end
  end
end
