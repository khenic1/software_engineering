# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end
    
    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    
    def median
        return nil if self.empty?
        if self.length.odd?
            mid_index = self.length / 2
            return self.sort[mid_index]
        else 
            sorted = self.sort
            mid_index = self.length / 2
            first_ele = sorted[mid_index]
            second_ele = sorted[mid_index - 1]
            return (first_ele + second_ele) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        return count
    end

    def my_count(target)
        num = 0
        self.each do |ele|
            if ele == target
                num += 1
            end
        end
        num
    end

    def my_index(target)
        self.each_with_index do |ele, i|
            if ele === target
                return i
            end
        end
        nil
    end

    def my_unique
        hash = {}
        self.each {|ele| hash[ele] = true}
        hash.keys
    end

    def my_transpose
        new_arr = []
        (0...self.length).each do |row|
            new_row = []
            (0...self.length).each do |col|
            new_row << self[row][col]
            end
            new_arr << new_row
        end

        new_arr
    end
end


