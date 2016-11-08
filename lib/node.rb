require_relative 'empty_node'

module BinaryTree
  # Node
  class Node
    attr_reader :count
    attr_accessor :left, :right, :parent, :value

    def initialize(v)
      if v.class == Array
        init_array(v)
      else
        init_int(v)
      end
    end

    def init_array(v)
      @value = v[0]
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = nil
      @count = 1
      v.delete(v[0])
      v.each do |number|
        insert(number)
      end
    end

    def init_int(v)
      @value = v
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = nil
      @count = 1
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
        true
      else
        false
      end
    end

    def return_values_under_node
      values = []
      valuesleft = []
      valuesright = []
      values.push(value)
      valuesleft = left.return_values_under_node if left.class != EmptyNode
      valuesright = right.return_values_under_node if right.class != EmptyNode
      valuesleft.each do |value|
        values.push(value) unless value.nil?
      end
      valuesright.each do |value|
        values.push(value) unless value.nil?
      end
      values
    end

    def delete_value(v)
      if value == v
        delete_node
      elsif value < v
        right.delete_value(v)
      else
        left.delete_value(v)
      end
    end

    def delete_node
      if left.class != EmptyNode && right.class != EmptyNode
        delete_with_both_sides
      elsif left.class != EmptyNode
        delete_with_left_side
      elsif right.class != EmptyNode
        delete_with_right_side
      else
        delete_without_children
      end
    end

    def delete_with_both_sides
      x = get_max_node(left).value
      delete_value(x)
      self.value = x
    end

    def delete_with_left_side
      if parent.nil?
        delete_root('left')
      else
        left.parent = parent
        if parent.left == self
          parent.left = left
        else
          parent.right = left
        end
      end
    end

    def delete_with_right_side
      if parent.nil?
        delete_root('right')
      else
        right.parent = parent
        if parent.left == self
          parent.left = right
        else
          parent.right = right
        end
      end
    end

    def delete_root(option)
      if option == 'right'
        self.value = right.value
        self.left = right.left
        self.right = right.right
      else
        self.value = left.value
        self.right = left.right
        self.left = left.left
      end
    end

    def delete_without_children
      if parent.left == self
        parent.left = EmptyNode.new
      else
        parent.right = EmptyNode.new
      end
    end

    def return_max_in_node
      values = return_values_under_node
      v = values.sort[values.length - 1]
      v.to_int
    end

    def return_min_in_node
      values = return_values_under_node
      v = values.sort[0]
      v.to_int
    end

    def return_node_count
      size
    end

    private

    def insert_left(v)
      left.insert(v) || (self.left = Node.new(v) and (left.parent = self))
    end

    def insert_right(v)
      right.insert(v) || (self.right = Node.new(v) and (right.parent = self))
    end

    def get_max_node(v)
      if v.right.class != EmptyNode
        get_max_node(v.right)
      else
        v
      end
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
      left.check_node(v)
    end

    def check_node_right(v)
      right.check_node(v)
    end

    def size
      size = 1
      size += @left.size if left.class != EmptyNode
      size += @right.size if right.class != EmptyNode
      size
    end
  end
end
