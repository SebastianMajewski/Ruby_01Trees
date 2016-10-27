
require 'simplecov'
SimpleCov.start

require 'node'

RSpec.describe 'node.rb' do
  let(:tree) { BinaryTree::Node.new(10) }
  describe '#constructor' do
    it 'should be defined' do
      expect { BinaryTree::Node.new(10) }.not_to raise_error
    end
    it 'init with good type' do
      expect(tree.get_max.class).to eq(Fixnum)
    end
    it 'init with good value' do
      expect(tree.get_max).to eq(10)
    end
    it 'init only one value' do
      expect(tree.get_node_count).to eq(1)
    end
  end
  describe '#insert' do
    it 'should be defined' do
      expect { tree.insert(11) }.not_to raise_error
    end
    it 'adds good value' do
      expect { tree.insert(11) }.to change{ tree.get_max }.to(11)
    end
  end
end
