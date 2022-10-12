require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees=[]
    end
    def valid_title?(title)
        return true if @salaries.keys.include?(title)
        return false
    end
    def >(startup)
        return true if @funding > startup.funding
        return false
    end
    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise ArgumentError.new('Not a valid title')
            #this is how to raise an error
        end
    end
    def size
        @employees.length
    end
    def pay_employee(employee)
        if salaries[employee.title]<@funding
            employee.pay(salaries[employee.title])
            @funding-=salaries[employee.title]
        else
            raise ArgumentError.new('Not enough funding')
        end
    end
    def payday
        @employees.each{|employee| pay_employee(employee)}
    end

    def average_salary
        @employees.inject(0){|acc, el| acc + salaries[el.title]}/ @employees.length.to_f
    end
    def close
        @employees=[]
        @funding=0
    end
    def acquire(startup)
        @funding+=startup.funding
        @salaries = startup.salaries.merge(@salaries)
        @employees += startup.employees
        startup.close
    end
end
