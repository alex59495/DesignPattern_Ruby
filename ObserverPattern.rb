# module Observable
#   def initialize
#     @observers = []
#   end
#   def add_observer(observer)
#     @observers << observer
#   end
  
#   def delete_observer(observer)
#     @observers.delete(observer)
#   end

#   def notify_observers
#     @observers.each do |obs|
#       obs.update(self)
#     end
#   end
# end

require 'observer'

class Employee
  include Observable

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def new_salary(salary)
    @salary = salary
    changed
    notify_observers(self)
  end
end

class Payroll
  def update(changed_employee)
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update( changed_employee )
  puts("Send #{changed_employee.name} a new tax bill!")
  end
end