
require 'simplecov'
SimpleCov.start

require 'node'

RSpec.describe 'node.rb' do
  let(:tree) { BinaryTree::Node.new(10) }
  let(:bigTree) { BinaryTree::Node.new([6, 3, 9, 5, 7]) }
  describe '#constructor' do
    it 'should be defined' do
      expect { BinaryTree::Node.new(10) }.not_to raise_error
    end
    it 'init with good value' do
      expect(tree.return_values_under_node).to include(10)
    end
    it 'init only one value' do
      expect(tree.return_node_count).to eq(1)
    end
  end
  describe '#insert' do
    it 'should be defined' do
      expect { tree.insert(11) }.not_to raise_error
    end
    context 'when inserting' do
      it 'good adding max value' do
        expect { tree.insert(11) }.to change { tree.return_max_in_node}.to(11)
      end
      it 'good adding min value' do
        expect { tree.insert(9) }.to change { tree.return_min_in_node }.to(9)
      end
      it 'not adding value which is in tree' do
        expect { tree.insert(10) }.to_not change { tree.return_node_count }
      end
    end
  end
  describe '#size' do
    it 'should be defined' do
      expect { bigTree.return_node_count }.not_to raise_error
    end
    it 'when adding' do
      expect { bigTree.insert(99) }.to change { bigTree.return_node_count }.by(1)
    end
    it 'when deleting' do
      expect { bigTree.delete_value(5) }.to change { bigTree.return_node_count }.by(-1)
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
  describe '#delete' do
    it 'should be defined' do
      expect { bigTree.delete_value(5) }.not_to raise_error
    end

    # add context
    
    it 'when deleting with only left value' do
      expect { bigTree.delete_value(5) }.to change { bigTree.return_node_count }.by(-1)
      expect { bigTree.delete_value(6) }.to change { bigTree.in_tree?(6) }.from(true).to (false)
    end
    it 'when deleting with only right value' do
      expect { bigTree.delete_value(3) }.to change { bigTree.return_node_count }.by(-1)
    end
    it 'when deleting with both values' do
      expect { bigTree.delete_value(6) }.to change { bigTree.return_node_count }.by(-1)
    end
    it 'when deleting root' do
      expect { bigTree.delete_value(6) }.to change { bigTree.return_node_count }.by(-1)
    end
  end
end
