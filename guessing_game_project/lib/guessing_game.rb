class GuessingGame
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def num_attempts
        @num_attempts
    end

    def check_num(number)
        @num_attempts += 1
        if number == @secret_num
            puts "you win"
            @game_over = true
        elsif number < @secret_num
            puts "too small"
        else 
            puts "too big"
        end
    end

    def ask_user
        puts "enter a number: "
        number = gets.chomp.to_i
        self.check_num(number)
    end
end
