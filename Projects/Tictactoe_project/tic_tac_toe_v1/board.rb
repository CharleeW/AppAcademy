class Board
    attr_reader :grid
    
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, mark)
        @grid[position[0]][position[1]] = mark
    end

    def valid?(position)
        row = position[0]
        column = position[1]
        if row > 3 || row < 0
            return false
        elsif column > 3 || column < 0
            return false
        else
            return true
        end
    end

    def empty?(position)
        return true if self[position] == "_"
        false
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            self[position] = mark
        else
            raise "not available"
        end
    end

    def print
        p @grid[0]
        p @grid[1]
        p @grid[2]
    end

    def win_row?(mark)

        @grid.each do |r|
            if r.all? {|c| c == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        i = 0
        while i < @grid.length
            k = 0
            while k < @grid.length - 1
                if @grid[k][i] == mark
                    k += 1
                else
                    break
                end
            return true if k == @grid.length - 1
            end
            i += 1
        end
        false
    end


    def win_diagonal?(mark)
        left_daig(mark) || right_daig(mark)
    end


    def left_daig(mark)
        k = 0
        while k <= @grid.length
            if @grid[k][k] == mark
                k += 1
            else
                break
            end
            return true if k == @grid.length
        end
        false
    end

    def right_daig(mark)
        k = @grid.length
        i = 0
        while k >= 0
            if @grid[i][k] == mark
                k -= 1
                i += 1
            else
                break
            end
            return true if k == 0
        end
        false
    end

    def win?(mark)
       self.win_col?(mark) || self.win_diagonal?(mark) || self.win_row?(mark)
    end

    def empty_positions?
        @grid.each {|r| return true if r.include?("_")}
        false
    end

end