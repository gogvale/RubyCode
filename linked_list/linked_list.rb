class Node
  attr_accessor :value, :next_node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  def to_s
    @value.to_s
  end
end

class LinkedList
  attr_reader :head, :tail, :size

  def initialize(value = nil)
    @size = 0
    @head = Node.new value
    @tail = @head
    @size += 1 unless value.nil?
  end

  def append(value = nil)
    if size.zero?
      initialize value
    else
      new_node = Node.new value
      @tail.next_node = new_node
      @tail = new_node
      @size += 1
    end
    self
  end

  def prepend(value = nil)
    new_node = Node.new value
    new_node.next_node = @head
    @head = new_node
    @size += 1
    self
  end

  def at(index)
    value = @head
    index.times do
      value = value.next_node unless value.nil?
    end
    value
  end

  def pop
    return nil if size.zero?

    removed_value = nil
    if size == 1
      @head = nil
      removed_value = @tail
      @tail = nil
    else
      new_last = at(size - 2)
      removed_value = @tail
      @tail = new_last
      @tail.next_node = nil
    end
    @size -= 1
    removed_value
  end

  def contains?(value)
    !find(value).nil?
  end

  def find(value)
    index = 0
    node = @head
    until node.nil?
      return index if node.value == value

      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    values = ''
    node = @head
    until node.nil?
      values << "( #{node.value} )"
      node = node.next_node
      values << ' -> ' unless node.nil?
    end
    values
  end

  def insert_at(index, value)
    if index < 1
      prepend value
      return
    else
      index -= 1
      node = @head
    end

    index.times do
      node = node.next_node unless node.nil?
    end

    if node.nil?
      append value
    else
      new_value = Node.new value
      next_value = node.next_node
      node.next_node = new_value
      new_value.next_node = next_value
    end
  end

  def remove_at(index)
    if index.negative?
      return
    else
      index -= 1
      node = @head
    end

    index.times do
      node = node.next_node unless node.nil?
    end

    unless node.nil?
      to_delete = node.next_node
      node.next_node = to_delete.next_node unless to_delete.nil?
      @size -= 1
    end
  end
end
