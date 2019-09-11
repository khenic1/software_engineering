class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def age=(age)
        @age = age
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        @bark
    end

    def favorite_foods
        @favorite_foods
    end

    def bark()
        if self.age > 3
            @bark.upcase
        else
            @bark.downcase
            
        end
    end

    def favorite_food?(food)
        lower_food = food.downcase
        @favorite_foods.include?(lower_food)
    end
    
end


ty = Dog.new("Ty", "shepherd", 7, "boof", ['cheese', 'chicken'])
p ty.favorite_food?('cheese')