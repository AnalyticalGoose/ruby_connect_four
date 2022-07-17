require 'matrix'

require_relative 'variables.rb'
include Variables

require_relative 'win.rb'
include CheckWinConditions


class ConnectFour
    attr_reader :board, :column
    
    def initialize
        @board = Array.new(6) {Array.new(7){"🞅 "}} << ["\e[34;1m1  2  3  4  5  6  7\e[0m \n "]
        @column = Array.new(8) {6}
        @board       
        @player_turn = "R"
        @R_positions = []
        @Y_positions = []
    end

    def draw_board
        @board.each { |x| puts x.join(" ") }  
    end

    def selection(n)
        if @player_turn == "R"
            @board[@column[n]-1][n-1] = RED
            @R_positions << [@column[n], n]
            check_win
            @player_turn = "Y"
        else
            @board[@column[n]-1][n-1] = YEL
            @Y_positions << [@column[n], n]
            check_win
            @player_turn = "R"
        end
        @column[n] -= 1
    end

    def check_win
        if @player_turn == "R"
            lm = @R_positions[0] # last move
            positions = @R_positions
            tc = "31m🞅" # token colour       
        else @player_turn == "Y"
            lm = @Y_positions[0]
            positions = @Y_positions
            tc = "33m🞅" # token colour
        end

           #check for vertial win
            vertical = [[lm[0]-1, lm[1]], [lm[0]-2, lm[1]], [lm[0]-3, lm[1]]] 
            vertical & positions == vertical ? win : nil

            #check horizontal win
            row = @board[lm[0]-1]                   
            row.to_s.include?("\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\"") == true ? win : nil

            # check for diagonal win 
            # offset caculations for array pruning
            x = lm[0]-lm[1]
            x > 0 ? nil : x = 0     # x-axis pruning
            y = lm[1]-lm[0]
            y > 0 ? nil : y = 0     # y-axis pruning

            # top-right to bottom left array generation
            tlbr = []
            @board.each {|i| tlbr << i[x..-1]}
            tlbr = tlbr[y..-2]
            row = (0..tlbr.size-1).collect { |i| tlbr[i][i]}
            row.to_s.include?("\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\"") == true ? win : nil 


            # offset caculations for array pruning
            m = (lm[0] + lm[1])-9 
            m < 0 ? nil : m = -1    # x-axis pruning
            n = 7-(lm[0] + lm[1]) 
            n < 0 ? nil : n = -1    # y-axis pruning

            # top-right to bottom left array generation
            trbl = []
            @board.each {|i| trbl.prepend(i[..m].reverse)}
            trbl[1..n].reverse
            row = (0..trbl[1..n].size-1).collect { |i| trbl[1..n].reverse[i][i]}
            row.to_s.include?("\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\", \"\\e[#{tc} \\e[0m\"") == true ? win : nil 
    end

    def win
        abort "#{@player_turn} wins!"
    end

end








game = ConnectFour.new

game.selection(3)
game.selection(4)
game.selection(4)
game.selection(5)
game.selection(6)

game.selection(5)
game.selection(5)
game.selection(6)
game.selection(7)
game.selection(6)
game.selection(6)

game.draw_board



#⭗