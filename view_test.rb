require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'view'

class ViewTest < Minitest::Test
    def setup
        data = {:astroid_list=>
                                [{:name=>"(2000 OK8)",
                                    :diameter=>"1778 ft",
                                    :miss_distance=>"39880235 miles"},
                                {:name=>"68950 (2002 QF15)",
                                    :diameter=>"10233 ft",
                                    :miss_distance=>"33142642 miles"},
                                {:name=>"(2009 TK8)",
                                    :diameter=>"1862 ft",
                                    :miss_distance=>"38533417 miles"},
                                {:name=>"(2015 YA)",
                                    :diameter=>"64 ft",
                                    :miss_distance=>"7386050 miles"},
                                {:name=>"(2017 BY93)",
                                    :diameter=>"467 ft",
                                    :miss_distance=>"42477777 miles"}],
                :biggest_astroid=>10233,
                :total_number_of_astroids=>5}
        @view = View.new(data)
    end

    def test_it_exist
       assert_instance_of View, @view 
    end

    def test_it_has_attributes
        assert_equal 10233, @view.largest_astroid
        assert_equal 5, @view.total_number_of_astroids
    end

    def test_has_column_data
        expected = {
                        :name=>{:label=>"Name", :width=>17},
                        :diameter=>{:label=>"Diameter", :width=>8},
                        :miss_distance=>{:label=>"Missed The Earth By:", :width=>20}
                    }
        assert_equal expected, @view.column_data
    end

    def test_has_formated_data
        row_data = {:name=>"(2000 OK8)", :diameter=>"1778 ft",:miss_distance=>"39880235 miles"}
        assert_nil @view.format_row_data(row_data)
    end

    def test_can_create_rows
        expected = [
                        {:name=>"(2000 OK8)",
                        :diameter=>"1778 ft",
                        :miss_distance=>"39880235 miles"},
                        {:name=>"68950 (2002 QF15)",
                        :diameter=>"10233 ft",
                        :miss_distance=>"33142642 miles"},
                        {:name=>"(2009 TK8)",
                        :diameter=>"1862 ft",
                        :miss_distance=>"38533417 miles"},
                        {:name=>"(2015 YA)",
                        :diameter=>"64 ft",
                        :miss_distance=>"7386050 miles"},
                        {:name=>"(2017 BY93)",
                        :diameter=>"467 ft",
                        :miss_distance=>"42477777 miles"}
                    ]

        assert_equal expected, @view.create_rows
    end
end