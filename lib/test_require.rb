require_relative 'binary_tree'

tree = BinaryTree::Node.new(10)

# Insert
tree.insert(18)
tree.insert(3)

tree.print_values

# Is in tree

tree.in_tree?(5)
tree.in_tree?(10)

# Delete :

tree.delete_value(10)
tree.print_values
tree.write_node_count

# Min / Max
tree.write_max
tree.write_min


# TESTS
# INSERT : BEEING, GOOD NUMBER OF INSERTION, IS INTEGER
# MIN and MAX : BEING< INTEGER, GOOD Number
# WRITE NODE COUNT : Being, INTEGER, GOOD NUMBER
# DELETE : Being, return bool, good number of records, warunki brzegowe
# IS IN TREE : BEING, returning good value, bool
