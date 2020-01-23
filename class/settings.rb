require 'json'
require 'awesome-pry'
class Settings
  attr_reader :notification, :times

  def initialize
    if File.file?('settings.json')
      file = File.open('settings.json', 'r').read
      options = JSON.parse(file)
      @notification = options['notification']
      @times = options['times']
    else
      begin
        options = {
          'notification': 'notify-send',
          'times': [
            '00:05:00',
            '00:10:00',
            '00:20:00'
          ]
        }
        @notification = options[:notification]
        @times = options[:times]

        save options
      rescue => exception
        p exception
      end
    end
  end

  def add_time(time)
    @times << time

    options = {
      'notification': @notification,
      'times': @times
    }

    save options
  end

  def change_notification(notification)
    @notification = notification

    options = {
      'notification': @notification,
      'times': @times
    }

    save options
  end

  def save(options)
    File.open 'settings.json', 'w'  do |f|
      f.print options.to_json
      f.close
    end
  end
end
