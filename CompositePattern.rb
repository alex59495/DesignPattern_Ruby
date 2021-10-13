class Task
  attr_accessor :name, :parent
  def initiliaze(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
    # 1 minute to add flour and sugar
  end
end
class MixTask < Task
  def initialize
    super('Mix that batter up!')
  end
  def get_time_required
    3.0
    # Mix for 3 minutes
  end
end

class AddLiquidsTask < Task
  def initialize
    super('Add liquid mamene!')
  end
  def get_time_required
    0.5
    # Mix for 3 minutes
  end
end

class CompositeTask < Task
  def initialize(name)
    @name = name
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  # def [](index)
  #   @sub_tasks[index]
  # end

  # def []=(index, new_value)
  #   @sub_tasks[index] = new_value
  # end
  
  def remove_sub_task(task)
    @sub_task.delete(task)
    task.parent = nil
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }
    time
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    @sub_tasks = []
    add_sub_task( AddDryIngredientsTask.new )
    add_sub_task( AddLiquidsTask.new )
    add_sub_task( MixTask.new )
  end
end