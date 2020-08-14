require 'minitest/autorun'
require 'pry'
require 'figaro'
require 'faraday'
require_relative 'service.rb'

Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class ServiceTest < Minitest::Test
   def setup
       @service = Service.new("1993-05-16")
   end

   def test_it_exist
       assert_instance_of Service,  @service
   end

   def test_it_can_connect
       assert_equal @service.conn.class, Faraday::Connection
   end

   def test_it_has_data
       assert_equal @service.largest_astroid_diameter, 10233
   end

   def test_it_has_formatted_data
        expected = {:name=>"(2000 OK8)", :diameter=>"1778 ft", :miss_distance=>"39880235 miles"}
        assert_equal expected,  @service.formatted_asteroid_data.first
   end
end
