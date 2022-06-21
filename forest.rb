require "getoptlong"
require 'nyaplot'
# funckja wypisujaca las
$burning_started = 0
$pandomierz = 0
$all_sums = Array.new()
def displayForest(forest, display_bollean) # lass moze byc nullem, to problem
    my = forest.length
    mx = forest[0].length

    burnt_trees_counter = 0

    my.times { |y|
        mx.times { |x|
            case forest[y][x]
            when 0
                display_bollean and print "🟫" 
            when 1
                display_bollean and print "🎋"
            when 2
                display_bollean and print "🔥"
                burnt_trees_counter += 1
            when 3
                display_bollean and print "⭍"
            when 4
                display_bollean and print "🐼"
            when 5
                display_bollean and print "🍖"
            end
        }
        display_bollean and puts
    }
    display_bollean and puts

    return burnt_trees_counter + $burning_started
end

# funckja tworząca las
def makePlainForest(mx, my)
   #to w sumie dziala jak pętla
    forest = Array.new(my) {
        Array.new(mx)
    }
    for y in 0 ... my # 0 .. 2 da 0, 1, 2 jeżeli damy 0 ... 2 to bedzie bez ostatniej
        for x in 0 ... mx do
            forest[y][x] = 0
        end
    end 
    return forest
end

def plantTrees(forest, trees)
    count = 0
    maxy = forest.length
    maxx = forest[0].length
    trees = (trees < maxx * maxy ) ? trees : maxx * maxy
    while count < trees do
        x = rand(maxx)
        y = rand(maxy)
        if forest[y][x] == 0 then
            forest[y][x] = 1 #przyjmijmy, ze 1 to drzewo zielone
            count += 1
        end
    end 
end

# return cords where thunder hit
def thunder(mx, my)
    return rand(mx), rand(my)
end

# burn given forest, it burn the trees all around the burning one
def burn_forest(forest, x, y)
    #x is for x-axis, y is for y-axis
    if ( 0 ... $maxx ) === x and ( 0 ... $maxy ) === y then
        if forest[y][x] == 1 then
            forest[y][x] = 2
            $burning_started = 1
            burn_forest(forest, x + 1, y)
            burn_forest(forest, x - 1, y)
            burn_forest(forest, x, y + 1)
            burn_forest(forest, x, y - 1)
            burn_forest(forest, x + 1, y + 1)
            burn_forest(forest, x - 1, y - 1)
            burn_forest(forest, x + 1, y - 1)
            burn_forest(forest, x - 1, y + 1)
        end
        if forest[y][x] == 4 then
            forest[y][x] = 5
            $pandomierz = 1
        end
    end
end

# gets array of means and plots them to html file
def plot_and_save(values_array)
    xaxis = Array.new( [ *1 .. values_array.length ] )
    xaxis.map! { |element|
        element.to_f / values_array.length
    }
    plot = Nyaplot::Plot.new
    sc = plot.add(:scatter, xaxis, $array_of_means)
    plot.x_label("Forest density in %")
    plot.y_label("Burnt pandas in %")
    color = Nyaplot::Colors.qual
    sc.color(color)
    plot.export_html("plot.html") #",values_array,"x","",".html"
end

# simulate forest, gives output of x samples with y repeats, can display forests
def forest_make_simulation(number_of_samples, number_of_repeats, display_bool)
    $summary_for_single_set = Array.new()
    $array_of_means = Array.new()
    for sampel_index in 1 .. number_of_samples do
        for repeat_index in 1 .. number_of_repeats  do
            $pandomierz = 0
            $forest = makePlainForest($maxx, $maxy)
            plantTrees($forest, (sampel_index.to_f / number_of_samples * $maxx * $maxy))
            x, y = thunder($maxx, $maxy)
            panda_x, panda_y = thunder($maxx, $maxy)
            $forest[panda_y][panda_x] = 4
            burn_forest($forest, x, y)
            $forest[y][x] = 3
            burnt_trees = displayForest($forest, display_bool)
            if burnt_trees.to_f != nil then
                $summary_for_single_set.append( burnt_trees.to_f / (sampel_index.to_f / number_of_samples * $maxx * $maxy).ceil )
            elsif  burnt_trees.to_f == 0
                $summary_for_single_set.append( burnt_trees.to_f / (sampel_index.to_f / number_of_samples * $maxx * $maxy).ceil )
            else
                $summary_for_single_set.append(0)
            end
            # $summary_for_single_set.append($pandomierz.to_f)
        end
        $array_of_means.append( ($summary_for_single_set.sum(0.0)).to_f / ($summary_for_single_set.length).to_f)
        # puts " "
        # print $summary_for_single_set
        # puts " "
        $summary_for_single_set.clear
    end
    puts $array_of_means
    $all_sums.append($array_of_means[-70])
    if $all_sums.length < 2 then
        return true
    elsif $all_sums[-1] - $all_sums[-2] < 0.0001 and $all_sums[-1] - $all_sums[-2] > -0.0001
        return false
    else
        return true
    end
end