require 'time'

module Pomodoro
  def start(time)
    time = Time.parse(time)
    p "Starting timer of #{time.hour} h, #{time.min} m and #{time.sec} s"
    start = Time.now

    while Time.now - start < time.sec
      sleep 1
      p (Time.now - start).to_i
    end

    true
  end
end
