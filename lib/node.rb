class Node
  include Enumerable

  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end

  def each(&block)
    block.call(self)
    if left != nil
      left.each(&block)
    end
    if right != nil
      right.each(&block)
    end
  end

  def <=>(other_node)
    data <=> other_node.data
  end
end

root = Node.new(3)
root.left = Node.new(2)
root.right = Node.new(1)
puts "---"
root.each {|x| puts x.data }

# just a few of the various operations Enumerable provides
puts "---"
sum = root.inject(0) { |memo, val| memo += val.data }
puts "---"
puts "SUM = #{sum}"
puts "---"
puts "MAX #{root.max.data}"
puts "---"
puts "SORT #{root.sort.map(&:data)}"
puts "---"
root.each do |x|
  puts x.inspect
end
