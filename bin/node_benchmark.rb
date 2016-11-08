require 'benchmark'
require_relative '../lib/node'

tree = BinaryTree::Node.new(9)

tree.insert(4)
tree.insert(30)
tree.insert(31)
tree.insert(29)
tree.insert(28)

Benchmark.bm do |x|
  x.report('init int            ') { BinaryTree::Node.new(9) }
  x.report('init array          ') { BinaryTree::Node.new([4, 7]) }
  x.report('insert value        ') { tree.insert(10) }
  x.report('insert value inTree ') { tree.insert(9) }

  x.report('delete existing     ') { tree.delete_value(4) }
  x.report('delete not existing ') { tree.delete_value(4) }

  x.report('searching in array  ') { [1, 5, 7, 2, 6, 32].include?(32) }
  x.report('searching in tree   ') { tree.in_tree?(28) }
end
