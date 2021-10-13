class Computer
  attr_accessor :display
  attr_accessor :motherboard
  attr_reader :drives
  def initialize(display=:crt, motherboard=Motherboard.new, drives=[])
    @motherboard = motherboard
    @drives = drives
    @display = display
  end
end

class CPU
  # Common CPU stuff...
end
class BasicCPU < CPU
  # Lots of not very fast CPU-related stuff...
end
class TurboCPU < CPU
  # Lots of very fast CPU stuff...
end

class Motherboard
  attr_accessor :cpu
  attr_accessor :memory_size
  def initialize(cpu=BasicCPU.new, memory_size=1000)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type # either :hard_disk, :cd or :dvd
  attr_reader :size # in MB
  attr_reader :writable # true if this drive is writable
  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end

class ComputerBuilder
  attr_reader :computer
  def initialize
    @computer = Computer.new
  end
  def turbo(has_turbo_cpu=true)
    @computer.motherboard.cpu = TurboCPU.new
  end
  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end
end

class DesktopComputer < Computer
  # Lots of interesting desktop details omitted...
end
class LaptopComputer < Computer
  def initialize( motherboard=Motherboard.new,  drives=[] )
    super(:lcd, motherboard, drives)
  end
  # Lots of interesting laptop details omitted...
end

class DesktopBuilder < ComputerBuilder
  def initialize
    @computer = DesktopComputer.new
  end
  def display=(display)
    @display = display
  end
  def add_cd(writer=false)
    @computer.drives << Drive.new(:cd, 760, writer)
  end
  def add_dvd(writer=false)
    @computer.drives << Drive.new(:dvd, 4000, writer)
  end
  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end

class LaptopBuilder < ComputerBuilder
  def initialize
    @computer = LaptopComputer.new
  end
  def display=(display)
    raise "Laptop display must be lcd" unless display == :lcd
  end
  def add_cd(writer=false)
    @computer.drives << LaptopDrive.new(:cd, 760, writer)
  end
  def add_dvd(writer=false)
    @computer.drives << LaptopDrive.new(:dvd, 4000, writer)
  end
  def add_hard_disk(size_in_mb)
    @computer.drives << LaptopDrive.new(:hard_disk, size_in_mb, true)
  end
end