class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades =  Hash.new { |hash, key| hash[key] = [] }
    
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else 
            return false
        end
    
    end

    def enrolled?(student)
        return @students.include?(student)
    
    end

    def student_to_teacher_ratio
        return @students.length / @teachers.length
    end
    
    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade
            return true
        else 
            return false
        end      
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if self.enrolled?(student) && @grades[student].length > 0
            sum = 0;
            grades = @grades[student]
           grades.each { |grade| sum += grade }
            average = sum / grades.length
            return average.floor
        end
        return nil
    end
end
