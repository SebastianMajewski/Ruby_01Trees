require 'benchmark'
require_relative '../lib/node'

tree = BinaryTree::Node.new(9)

tree.insert(4)
tree.insert(30)
tree.insert(31)
tree.insert(29)
tree.insert(28)

arr = []
arr.push(8)
arr.push(99)
arr.push(92)
arr.push(91)




Benchmark.bm do |x|
  puts '  #constructor'
  x.report('init tree with int  ') { BinaryTree::Node.new(9) }
  x.report('init tree with array') { BinaryTree::Node.new([4, 7]) }
  x.report('init array          ') { [9] }
  puts '  #insert'
  x.report('new value in T      ') { tree.insert(10) }
  x.report('existing value in T ') { tree.insert(9) }
  x.report('push in array       ') { arr.push(1) }
  puts '  #delete'
  x.report('existing in T       ') { tree.delete_value(4) }
  x.report('!existing in T      ') { tree.delete_value(4) }
  x.report('existing in ARR     ') { arr.delete(8) }
  x.report('!existing in ARR    ') { arr.delete(5) }
  puts '  #searching'
  x.report('existing  in array  ') { arr.include?(91) }
  x.report('existing  in tree   ') { tree.in_tree?(28) }
  x.report('!existing  in array ') { arr.include?(100) }
  x.report('!existing  in tree  ') { tree.in_tree?(100) }
  puts '  #size'
  x.report('size in tree        ') { tree.return_node_count }
  x.report('size of array       ') { arr.count }
  puts ' #max/min'
  x.report('max in tree         ') { tree.return_max_in_node }
  x.report('max in array        ') { arr.max }
  x.report('min in tree         ') { tree.return_min_in_node }
  x.report('min in array        ') { arr.min }
end
