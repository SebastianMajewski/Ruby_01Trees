
require 'simplecov'
SimpleCov.start

require 'node'

RSpec.describe 'node.rb' do
  let(:tree) { BinaryTree::Node.new(10) }
  let(:bigTree) { BinaryTree::Node.new([3, 5, 2, 19]) }
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
    context 'when inserting' do
      it 'good adding max value' do
        expect { tree.insert(11) }.to change { tree.get_max }.to(11)
      end
      it 'good adding min value' do
        expect { tree.insert(9) }.to change { tree.get_min }.to(9)
      end
      it 'not adding value which is in tree' do
        expect { tree.insert(10) }.to_not change { tree.get_node_count }
      end
    end
  end
  describe '#size' do
    it 'should be defined' do
      expect { bigTree.get_node_count }.not_to raise_error
    end
    it 'when adding' do
      expect { bigTree.insert(99) }.to change { bigTree.get_node_count }.by(1)
    end
    it 'when deleting' do
      expect { bigTree.delete_value(2) }.to change { bigTree.get_node_count }.by(-1)
    end
  end
  describe '#is_in_Tree' do
    it 'should be defined' do
      expect { bigTree.in_tree?(5) }.not_to raise_error
    end
    it 'when value is in tree' do
      expect(bigTree.in_tree?(5)).to eq(true)
    end
    it 'when value is not in tree' do
      expect(bigTree.in_tree?(4)).to eq(false)
    end
  end

end
