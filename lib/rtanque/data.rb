module RTanque
  class Data
    def initialize match
      @match = match
    end

    def run
      @match_data = []
      old_bot_list = @match.bots.map { |bot| [bot.object_id, []] }.to_h
      explosions = {}
      while !@match.finished?
        @match.tick

        live_bots = @match.bots.map do |bot|
          [
            bot.object_id,
            {
              name: bot.name,
              x: bot.position.x,
              y: bot.position.y,
              health: bot.health,
              heading: bot.heading.to_degrees.to_f,
              turret: bot.turret.heading.to_degrees.to_f,
              radar: bot.radar.heading.to_degrees.to_f
            }
          ]
        end.to_h

        (old_bot_list.keys - live_bots.keys).each do |bot_id|
          explosions[bot_id] = {
            x: old_bot_list[bot_id][:x],
            y: old_bot_list[bot_id][:y],
            explosion: 0
          } if explosions[bot_id].nil?
        end

        explosions.keys.each do |bot_id|
          explosions[bot_id][:explosion] += 1
          explosions.delete(bot_id) if explosions[bot_id][:explosion] > 70
        end

        old_bot_list = live_bots

        @match_data << {
          bots: live_bots.values,
          explosions: explosions.values,
          shells: @match.shells.map do |shell|
                    { x: shell.position.x, y: shell.position.y }
                  end
        }
      end
      @match_data
    end
  end
end
