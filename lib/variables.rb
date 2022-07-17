
module Variables
    RED = "\e[31m🞅 \e[0m"
    YEL = "\e[33m🞅 \e[0m"
end


board = [
    [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 "], 
    [" 8 ", " 9 ", "10 ", "11 ", "12 ", "13 ", "14 "], 
    ["15 ", "16 ", "17 ", "18 ", "19 ", "20 ", "21 "], 
    ["22 ", "23 ", "24 ", "25 ", "26 ", "27 ", "28 "], 
    ["29 ", "30 ", "31 ", "32 ", "33 ", "34 ", "35 "], 
    ["36 ", "37 ", "38 ", "39 ", "40 ", "41 ", "42 "], 
    ["\e[34;1m1  2  3  4  5  6  7\e[0m \n "]]


# lm = [4, 5] #27

# # offset caculations for array pruning
# x = lm[0]-lm[1]
# x > 0 ? nil : x = 0     # x-axis pruning
# y = lm[1]-lm[0]
# y > 0 ? nil : y = 0     # y-axis pruning

# # top-right to bottom left array generation
# tlbr = []
# board.each {|i| tlbr << i[x..-1]}
# tlbr = tlbr[y..-2]
# p (0..tlbr.size-1).collect { |i| tlbr[i][i]}   


# # offset caculations for array pruning
# m = (lm[0] + lm[1])-9 
# m < 0 ? nil : m = -1    # x-axis pruning
# n = 7-(lm[0] + lm[1]) 
# n < 0 ? nil : n = -1    # y-axis pruning

# # top-right to bottom left array generation
# trbl = []
# board.each {|i| trbl.prepend(i[..m].reverse)}
# trbl[1..n].reverse
# p (0..trbl[1..n].size-1).collect { |i| trbl[1..n].reverse[i][i]}