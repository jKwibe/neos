class Service
    def initialize(date)
        @date = date
    end

    
    def largest_astroid_diameter
        data.map do |astroid|
            astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
        end.max { |a,b| a<=> b}
    end
    
    def formatted_asteroid_data
        data.map do |astroid|
            {
                name: astroid[:name],
                diameter: "#{astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
                miss_distance: "#{astroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
            }
        end
        
    end
    
    def object_data
        
        {
            astroid_list: formatted_asteroid_data,
            biggest_astroid: largest_astroid_diameter,
            total_number_of_astroids: total_number_of_astroids
        }
    end
    
    private
    def conn
        Faraday.new(
            url: 'https://api.nasa.gov',
            params: { start_date: @date, api_key: ENV['nasa_api_key']}
        )
    end 
    
    def data
        asteroids_list_data = conn.get('/neo/rest/v1/feed')
        JSON.parse(asteroids_list_data.body, symbolize_names: true)[:near_earth_objects][:"#{@date}"]
    end

    def total_number_of_astroids
        data.count
    end
    
end