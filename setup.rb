# setup for testing the program
c = GetoptLong.new(
    ["--maxx", "-x", GetoptLong::OPTIONAL_ARGUMENT],
    ["--maxy", "-y", GetoptLong::OPTIONAL_ARGUMENT],
    ["--tree", "-d", GetoptLong::OPTIONAL_ARGUMENT]
)

c.each do |opt, arg|
    case opt
    when "--maxx"
        $maxx = arg.to_i
    when "--maxy"
        $maxy = arg.to_i
    when "--tree"
        $trees = arg.to_i
    end
end
$maxx = $maxx == nil ? 50 : $maxx # poziomy rozmiar planszy
$maxy = $maxy == nil ? 10 : $maxy # pionowy rozmiar planszy
$trees = $trees == nil ? 250 : $trees # liczba drzew