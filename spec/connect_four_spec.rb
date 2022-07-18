require_relative '../lib/main.rb'

describe ConnectFour do
    subject(:game) { described_class.new }

    describe '#initialize' do
        context 'when the board is created' do
            it 'has 6 rows (plus heading row)' do
                expect(game.board.size).to eq(7)
            end           
            it 'has 7 columns' do 
                expect(game.board[0].size).to eq(7)
                expect(game.board[5].size).to eq(7)
            end
        end

        context 'when the column array is created' do
            it 'covers 8 columns' do #one extra for error edge cases
                expect(game.column.size).to eq(8)
            end
            it 'equals to 6 for all values' do
                expect(game.column).to eq([6, 6, 6, 6, 6, 6, 6, 6])
            end

        end
    end
