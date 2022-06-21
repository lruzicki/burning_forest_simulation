require 'forest.rb'
require 'setup.rb'

$k = true

$opt_value = 100
while $k do
    # number_of_samples, number_of_repeats in sample, display_bool
    $k = forest_make_simulation(100, $opt_value, false)
    $opt_value += 50
end

plot_and_save($array_of_means)

print "\n", $all_sums, "\n"
puts $opt_value