module BinaryTree
  # Node
  class Node
    attr_reader :count
    attr_accessor :left, :right, :parent, :value

    def initialize(v)
      @value = v
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = nil
      @count = 1
    end

    def write_node_count
      puts "Number of elements : #{size}"
    end

    def insert(v)
      case value <=> v
      when 1 then insert_left(v)
      when -1 then insert_right(v)
      when 0 then @count += 1
      end
    end

    def in_tree?(v)
      if check_node(v)
        puts "#{v} is on tree!"
      else
        puts "#{v} is not on tree!"
      end
    end

    def print_values
      values = []
      valuesleft = []
      valuesright = []

      values.push(value)
      valuesleft = left.print_values if left.class != EmptyNode
      valuesright = right.print_values if right.class != EmptyNode
      valuesleft.each do |value|
        values.push(value) unless value.nil?
      end
      valuesright.each do |value|
        values.push(value) unless value.nil?
      end
      puts "Variables in tree (sorted) : #{values.sort}" if parent.nil?
      values
    end

    def write_height_of_tree
      l = get_height(left)
      r = get_height(right)
      if r > l
        puts "Height is #{r + 2}"
      else
        puts "Height is #{l + 2}"
      end
    end

    def write_min
      values = []
      valuesleft = []
      valuesright = []

      values.push(value)
      valuesleft = left.print_values if left.class != EmptyNode
      valuesright = right.print_values if right.class != EmptyNode
      valuesleft.each do |value|
        values.push(value) unless value.nil?
      end
      valuesright.each do |value|
        values.push(value) unless value.nil?
      end
      puts "Minimum in tree : #{values.sort[0]}" if parent.nil?
      values
    end

    def write_max
      values = []
      valuesleft = []
      valuesright = []

      values.push(value)
      valuesleft = left.print_values if left.class != EmptyNode
      valuesright = right.print_values if right.class != EmptyNode
      valuesleft.each do |value|
        values.push(value) unless value.nil?
      end
      valuesright.each do |value|
        values.push(value) unless value.nil?
      end
      puts "Minimum in tree : #{values.sort[values.length - 1]}" if parent.nil?
      values
    end

    def delete_value(v)
      if value == v
        puts "Deleting #{value}"
        if left.class != EmptyNode && right.class != EmptyNode

          x = get_max_node(left)
          self.value = x.value

          if x == x.parent.left
            x.parent.left = EmptyNode.new
          else
            x.parent.right = EmptyNode.new
          end

        elsif left.class != EmptyNode
          left.parent = parent

          if parent.left == self
            parent.left = left
          elsif parent.right == left
          end
        elsif right.class != EmptyNode
          right.parent = parent

          if parent.left == self
            parent.left = right
          else
            parent.right = right
          end
        else
          if parent.left == self
            parent.left = EmptyNode.new
          else
            parent.right = EmptyNode.new
          end
        end
      elsif value < v
        right.delete_value(v)
      else
        left.delete_value(v)
      end
    end

    private

    def insert_left(v)
      left.insert(v) || self.left = Node.new(v) and left.parent = self
    end

    def insert_right(v)
      right.insert(v) || (self.right = Node.new(v) and right.parent = self)
    end

    def get_max_node(v)
      if v.right.class != EmptyNode
        get_max_node(v.right)
      else
        v
      end
    end

    def get_height(v)
      return -1 if v.class == EmptyNode
      l = get_height(v.left)
      r = get_height(v.right)
      return r + 1 if r > l
      l + 1
    end

    protected

    def check_node(v)
      case value <=> v
      when 1 then
        check_node_left(v)
      when -1 then
        check_node_right(v)
      when 0 then true
      end
    end

    def check_node_left(v)
      if left
        left.check_node(v)
      else
        false
      end
    end

    def check_node_right(v)
      if right
        right.check_node(v)
      else
        false
      end
    end

    def size
      size = 1
      size += @left.size if left.class != EmptyNode
      size += @right.size if right.class != EmptyNode
      size
    end
  end

  # Empty Node
  class EmptyNode
    def check_node(*)
      false
    end

    def insert(*)
      false
    end

    def get_height(*)
      -1
    end

    def delete_value(*)
      puts 'No value in tree'
    end

    def print_values
      0
    end
  end
end
