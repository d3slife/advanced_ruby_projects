module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    return self
  end

  def my_select
    i = 0
    array = []
    while i < self.length
      if (yield(self[i]))
        array << self[i]
      end
      i += 1
    end
    return array
  end

  def my_any?
    i = 0
    while i < self.length
      if (yield(self[i]))
        return true
      end
      i += 1
    end
    return false
  end

  def my_none?
    i = 0
    while i < self.length
      if (yield(self[i]))
        return false
      end
      i += 1
    end
    return true
  end

  def my_count
    i = 0
    total = 0
    while i < self.length
      if (yield(self[i]))
        total += 1
      end
      i += 1
    end
    return total
  end

  def my_map(proc)
    i = 0
    array = []
    if (block_given?)
      while i < self.length
        array << yield(self[i])
        i += 1
      end
    else
      while i < self.length
        array << procedure.call(self[i])
        i += 1
      end
    end
    p array
    return array
  end

  def my_map_proc(someProc = nil)
    i = 0
    array = []
    if (not someProc.nil?)
      puts "Procedure is being used"
      while i < self.length
        array << someProc.call(self[i])
        i += 1
      end
    elsif (block_given?)
      puts "Block of code is being used"
      while i < self.length
        array << yield(self[i])
        i += 1
      end
    else
      return "Procedure wasn't passed"
    end
    return array
  end

  def my_inject(initial_value = nil)
    total = nil;
    if (initial_value)
      total = initial_value
    else
      total = 1
    end

    i = 0
    while i < self.length
      total = yield(total, self[i])
      i += 1
    end
    return total
  end

  def my_multiply
    self.my_inject {|total, element| total * element}
  end

  proc = Proc.new do |number|
    number + 3
  end

  puts (1..5).to_a.my_map_proc(proc)
  puts (1..5).to_a.my_map_proc {|number| number ** 2}
  puts (1..5).to_a.my_map_proc
end
