require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        return @employees.length
    end

    def pay_employee(employee)
        if self.funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else 
            raise "not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
           sum += @salaries[employee.title]

        end
        return sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        # add funding
        @funding += other_startup.funding

        # merging salaries
        other_startup.salaries.each do |title, salary|
            if self.salaries.has_key?(title)

            else 
                @salaries[title] = salary
            end
        end

        #hire employees
        @employees += other_startup.employees

        # close other startup
        other_startup.close

    end


end

startup = Startup.new("Google", 1000000000000, {"software engineer" => 100000, "ceo" => 200000})
# startup.hire("kelley", "ceo")
# employee_1 = startup.employees[0]
# startup.pay_employee(employee_1)
# p employee_1
p startup.average_salary



#   PART 3
#     #average_salary
#       should return a number representing the average employee salary (FAILED - 26)
#     #close
#       should set @employees to an empty array (FAILED - 27)
#       should set @funding to 0 (FAILED - 28)
#     #acquire
#       should accept another startup as an arg (FAILED - 29)
#       should add the given startup's funding to our @funding (FAILED - 30)
#       should add the given startup's salaries to our @salaries, without overwriting any of our existing @salaries (FAILED - 31)
#       should add the given startup's employees to our @employees (FAILED - 32)
#       should call Startup#close on the given startup (FAILED - 33)