module BinaryTree
  class Node

    attr_reader :count;
    attr_accessor :left, :right, :parent, :value;

    def initialize(v)
      @value = v;
      @left = EmptyNode.new
      @right = EmptyNode.new
      @parent = nil;
      @count = 1;
    end

    public

    def get_node_count
      puts "Number of elements : #{self.size}"
    end
    def insert(v)
      case value <=> v
      when 1 then insert_left(v)
      when -1 then insert_right(v)
      when 0 then @count += 1
      end
    end
    def is_in_tree(v)
      if (check_node(v))
        puts "#{v} is on tree!"
      else
        puts "#{v} is not on tree!"
      end
    end
    def print_values
      values = Array.new
      valuesleft = Array.new
      valuesright = Array.new

      values.push(value)
      if(left.class != EmptyNode)
        valuesleft = left.print_values
      end
      if(right.class != EmptyNode)
        valuesright = right.print_values
      end
      #puts "In node #{self.value} there are #{valuesleft} on left and #{valuesright} on right"
      for i in 0..valuesleft.count
        if(valuesleft[i] != nil)
          values.push(valuesleft[i])
        end
      end

      for i in 0..valuesright.count
        if(valuesright[i] != nil)
          values.push(valuesright[i])
        end
      end
      if(parent == nil)
        puts "Variables in tree (sorted) : "
        puts values.sort
        puts ""
      else
        return values
      end
    end
    def get_height_of_tree()
      l = get_height(self.left)
      r = get_height(self.right)
      if(r > l)
        puts "Height is #{r+2}"
      else
        puts "Height is #{l+2}"
      end
    end
    def get_min
      values = Array.new
      valuesleft = Array.new
      valuesright = Array.new

      values.push(value)
      if(left.class != EmptyNode)
        valuesleft = left.print_values
      end
      if(right.class != EmptyNode)
        valuesright = right.print_values
      end
      for i in 0..valuesleft.count
        if(valuesleft[i] != nil)
          values.push(valuesleft[i])
        end
      end

      for i in 0..valuesright.count
        if(valuesright[i] != nil)
          values.push(valuesright[i])
        end
      end
      if(parent == nil)
        puts "Minimum in tree : #{values.sort[0]}"
      else
        return values
      end
    end
    def get_max
      values = Array.new
      valuesleft = Array.new
      valuesright = Array.new

      values.push(value)
      if(left.class != EmptyNode)
        valuesleft = left.print_values
      end
      if(right.class != EmptyNode)
        valuesright = right.print_values
      end
      for i in 0..valuesleft.count
        if(valuesleft[i] != nil)
          values.push(valuesleft[i])
        end
      end

      for i in 0..valuesright.count
        if(valuesright[i] != nil)
          values.push(valuesright[i])
        end
      end
      if(parent == nil)
        puts "Maximum in tree : #{values.sort[values.length-1]}"
      else
        return values
      end
    end
    def delete_value(v)
      if (value == v)
        puts "Deleting #{self.value}"
        if(left.class != EmptyNode && right.class != EmptyNode)

          x = getMaxNode(left);
          self.value = x.value

          if(x == x.parent.left)
            x.parent.left = EmptyNode.new
          else
            x.parent.right = EmptyNode.new
          end

        elsif (left.class != EmptyNode)
          left.parent = self.parent

          if(self.parent.left == self)
            self.parent.left = self.left
          elsif
            self.parent.right = self.left
          end
        elsif (right.class != EmptyNode)
          right.parent = self.parent

          if(self.parent.left == self)
            self.parent.left = self.right
          elsif
            self.parent.right = self.right
          end
        else
          if(self.parent.left == self)
            self.parent.left = EmptyNode.new
          elsif
            self.parent.right = EmptyNode.new
          end
        end
      elsif (value < v)
        right.delete_value(v)
      else
        left.delete_value(v)
      end
    end

    private

    def insert_left(v)
      left.insert(v) or self.left = Node.new(v) and left.parent = self
    end
    def insert_right(v)
      right.insert(v) or self.right = Node.new(v) and right.parent = self
    end

    def getMaxNode(v)
      if(v.right.class != EmptyNode)
        return getMaxNode(v.right)
      else
        return v
      end
    end

    def get_height(v)
      if(v.class == EmptyNode)
        return -1;
      end
      l = get_height(v.left)
      r = get_height(v.right)
      if(r > l)
        return r+1
      else
        return l+1
      end
    end

    protected

    def check_node(v)
      case value <=> v
      when 1 then
        if left
          left.check_node(v)
        else
          false
        end
      when -1 then
        if right
          right.check_node(v)
        else
          false
        end
      when 0 then true
      end
    end

    def size
      size = 1;
      if left.class != EmptyNode
        size += @left.size
      end
      if right.class != EmptyNode
        size += @right.size
      end
      size
    end
  end
  class EmptyNode
    def check_node(*)
      false
    end
    def insert(*)
      false
    end
    def get_height(v)
      return -1
    end
    def delete_value(*)
      puts "No value in tree"
    end
    def getNodeAt(*)
      return 0
    end
    def print_values
      0
    end
  end
end

tree = BinaryTree::Node.new(10)
tree.insert(3)
tree.insert(4)
tree.insert(91)
tree.print_values()

tree.delete_value(10)

tree.print_values();
