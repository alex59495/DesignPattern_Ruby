class BankAccount
  attr_reader :balance
  def initialize(starting_balance=0)
    @balance = starting_balance
  end
  def deposit(amount)
    @balance += amount
  end
  def withdraw(amount)
    @balance -= amount
  end
end

class VirtualAccountProxy
  def initialize(real_account)
    @subject=real_account
  end

  def method_missing(name, *args)
    puts("Delegating #{name} message to subject.")
    @subject.send(name, *args)
  end
end

require 'etc'
class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end
  def method_missing(name, *args)
    check_access
    puts("Delegating to subject")
    @subject.send(:name, *args)
  end
  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{Etc.getlogin} cannot access account."
    end
  end
end

# class AccountProtectionProxy
#   def initialize(real_account, owner_name)
#     @subject = real_account
#     @owner_name = owner_name
#   end
#   def deposit(amount)
#     check_access
#     return @subject.deposit(amount)
#   end
#   def withdraw(amount)
#     check_access
#     return @subject.withdraw(amount)
#   end
#   def balance
#     check_access
#     return @subject.balance
#   end
#   def check_access
#     if Etc.getlogin != @owner_name
#       raise "Illegal access: #{Etc.getlogin} cannot access account."
#     end
#   end
# end

# class VirtualAccountProxy
#   def initialize(&creating_block)
#     @creating_block=creating_block
#   end
#   def deposit(amount)
#     s = subject
#     return s.deposit(amount)
#   end
#   def withdraw(amount)
#     s = subject
#     return s.withdraw(amount)
#   end
#   def balance
#     s = subject
#     return s.balance
#   end
#   def subject
#     @subject ||= @creating_block.call
#   end
# end

# class BankAccountProxy
#   def initialize(real_object)
#     @real_object = real_object
#   end
#   def balance
#     @real_object.balance
#   end
#   def deposit(amount)
#     @real_object.deposit(amount)
#   end
#   def withdraw(amount)
#     @real_object.withdraw(amount)
#   end
# end