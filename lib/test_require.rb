require_relative 'node'

tree = BinaryTree::Node.new(10)

tree.insert(3)
tree.insert(91)
tree.insert(1)
tree.insert(100)

tree.delete_value(10)
