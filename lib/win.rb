

module CheckWinConditions
    class CheckWin
        def initialize(player_turn, board, r_positions, y_positions)
            @player_turn = player_turn
            @board = board
            @R_positions = r_positions
            @Y_positions = y_positions
        end

        def check_win
            if @player_turn == "R"
                lm = @R_positions[0] # last move

                #check for vertial win
                vertical = [[lm[0]-1, lm[1]], [lm[0]-2, lm[1]], [lm[0]-3, lm[1]]] 
                vertical & @R_positions == vertical ? win : nil

                #check horizontal win
                row = @board[lm[0]-1]                   
                row.to_s.include?("\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\"") == true ? win : nil

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
                row.to_s.include?("\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\"") == true ? win : nil 

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
                row.to_s.include?("\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\", \"\\e[31m🞅 \\e[0m\"") == true ? win : nil 
            end
        end
        
        def win
            return true
        end
    end
end