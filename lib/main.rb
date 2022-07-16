require 'matrix'
require_relative 'variables.rb'

include Variables


class ConnectFour
    attr_reader :board, :column

    def initialize
        @board = Array.new(6) {Array.new(7){"🞅 "}} << ["\e[34;1m1  2  3  4  5  6  7\e[0m"]
        @column = Array.new(7) {6}
    end

    def draw_board
        @board.each { |x| puts x.join(" ") }   
    end

    def selection(n)
        @board[@column[n]-1][n-1] = "\e[31m🞅 \e[0m"
        @column[n] -= 1
    end


end


game = ConnectFour.new

game.selection(5)
game.selection(5)
game.selection(5)
game.selection(5)
game.draw_board