class Column
  attr_accessor :head

  def initialize
    @head = nil
    @tail = nil
  end

  def add_marker(marker)
    node = Node.new(marker, next_node=nil)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def size
    count = 1
    current = @head
    until current.next_node.nil?
      current = current.next_node
      count += 1
    end
    count
  end

end

class Node < Column
  attr_accessor :next_node

  def initialize(marker, next_node)
    @marker = marker
    @next_node = nil
  end
  
end