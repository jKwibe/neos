class View
    attr_reader :largest_astroid,
                :total_number_of_astroids
    def initialize(data)
      @astroid_list = data[:astroid_list]
      @total_number_of_astroids = data[:total_number_of_astroids]
      @largest_astroid = data[:biggest_astroid]
    end
    
    
    def header
        puts "________________________________________________________________________________________________________________________________"
        puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
        puts "Please enter a date in the following format YYYY-MM-DD."
        print ">>"
    end
    def column_data
        column_labels.each_with_object({}) do |(col, label), hash|
            hash[col] = {
                label: label,
                width: [@astroid_list.map { |astroid| astroid[col].size }.max, label.size].max}
        end
    end
    
    
    def header
        "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
    end

    def divider
        "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
    end
    
    def format_row_data(row_data)
        row = row_data.keys.map { |key| row_data[key].ljust(column_data[key][:width]) }.join(' | ')
        puts "| #{row} |"
    end
    def create_rows
        @astroid_list.each { |astroid| format_row_data(astroid)}
    end
    
    private
    def column_labels
        { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
    end
end