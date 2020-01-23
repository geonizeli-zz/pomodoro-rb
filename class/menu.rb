require 'time'
require_relative './settings'
require_relative '../module/pomodoro'

class Menu
  @settings = Settings.new

  def list_times
    p "Default times:"
    @settings.times.each.with_index do |time, index|
      t = Time.parse(time)
      puts "[#{index + 1}] #{t.min}"
    end
  end

  def start(option)
    Pomodoro.start @settings.times[option - 1]
  end

  def start_custom(minutes)
    Pomodoro.start "00-#{minutes}-00"
  end
end