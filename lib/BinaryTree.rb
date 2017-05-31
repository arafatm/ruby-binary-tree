class Node
  attr_accessor :value, :left, :right

  def initialize
    return self
  end

  def insert(v)
    @value = v if value.nil?
    case value <=> v
    when 1
      self.left = Node.new if left.nil?
      @left.insert(v)
    when -1
      self.right = Node.new if right.nil?
      @right.insert(v)
    end
    return self
  end

  def insert_a(a)
    a.each do |v|
      insert(v)
    end
  end

  def isbalanced?
    max = max_depth
    min = min_depth
    # puts "#{self.to_a.to_s}: #{max} - #{min} = #{max - min}"
    return ((max_depth - min_depth) <= 1)
  end

  def max_depth
    return 0 if left.nil? && right.nil?

    if left.nil?
      return 1 + right.max_depth
    elsif right.nil?
      return 1 + left.max_depth
    else
      return 1 + [left.max_depth, right.max_depth].max
    end
  end

  def min_depth
    return 0 if left.nil? || right.nil?

    return 1 + [left.min_depth, right.min_depth].min
  end

  def balance
    return self if @value == nil or (@left == nil && @right == nil)

    sorted = self.to_a
    @left = nil
    @right = nil

    assign_mid(self, sorted)

    return self
  end

  def assign_mid(node, a)

    if a.length == 1
      node.value = a[0]
      return node
    else
      i = (a.length / 2).round

      node.value = a[i]

      l = a[0..i-1]
      r = a[i+1..a.length-1]

      if l.length > 0
        node.left = Node.new
        assign_mid(node.left, l)
      end
      if r.length > 0
        node.right = Node.new
        assign_mid(node.right, r)
      end

    end

  end

  def search(v)
    case value <=> v
    when 0
      return true
    when -1
      return right.search(v) unless right.nil?
    when 1
      return left.search(v) unless left.nil?
    end
    return false
  end

  def to_a
    a = []

    a << @value
    a.concat(@left.to_a) unless @left.nil?
    a.concat(@right.to_a) unless @right.nil?

    return a
  end

  def to_s # preorder
    str = value.to_s

    str = str + " < #{left.to_s}" unless left.nil?
    str = str + " > #{right.to_s}" unless right.nil?
    return str
  end

  def inspect
    "{#{value} < #{left.inspect} > #{right.inspect}}"
  end

end


