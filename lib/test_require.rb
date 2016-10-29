require_relative 'node'

tree = BinaryTree::Node.new(10)

tree.insert(3)
tree.insert(91)
tree.insert(1)
tree.insert(100)

tree.print_values

tree.write_max
tree.write_min

tree.delete_value(10)

tree.print_values
tree.write_node_count

# MIN and MAX : BEING< INTEGER, GOOD Number
# WRITE NODE COUNT : Being, INTEGER, GOOD NUMBER
# DELETE : Being, return bool, good number of records, warunki brzegowe
# IS IN TREE : BEING, returning good value, bool
