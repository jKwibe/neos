require 'faraday'
require 'figaro'
require_relative 'service'
require 'pry'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  def self.find_neos_by_date(date)
    service = Service.new(date)
    service.object_data
  end
end
