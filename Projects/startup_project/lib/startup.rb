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

    def >(startup_2)
        self.funding > startup_2.funding
    end

    def hire(employee_name, title)
        raise "NOPE" if !self.valid_title?(title)
        new_employee = Employee.new(employee_name, title)
        @employees << new_employee
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        raise "NOPE" if @funding < salary

        employee.pay(salary)
        @funding -= salary
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    #Part 3 -------------------------------------------------------
    def average_salary
        total = 0
        @employees.each do |employee|
        total += @salaries[employee.title]
        end
        total / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding += startup_2.funding

        @salaries = startup_2.salaries.merge(@salaries)
        @employees += startup_2.employees
        startup_2.close
    end
end
