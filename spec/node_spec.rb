
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
    it 'should be defined with Array' do
      expect { BinaryTree::Node.new([12, 14, 17]) }.not_to raise_error
    end
    it 'init with Array returns good values' do
      expect(bigTree.return_values_under_node).to contain_exactly(3, 6, 5, 9, 7)
    end
    it 'init with Array returns good count' do
      expect(bigTree.return_node_count).to eq(5)
    end
  end
  describe '#insert' do
    it 'should be defined' do
      expect { tree.insert(11) }.not_to raise_error
    end
    context 'when inserting' do
      it 'good adding max value' do
        expect { tree.insert(11) }.to change { tree.return_max_in_node }.to(11)
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

    context 'when deleting with only left value' do
      it 'reduce node count' do
        expect { bigTree.delete_value(9) }.to change { bigTree.return_node_count }.by(-1)
      end
      it 'delete the right value' do
        expect { bigTree.delete_value(9) }.to change { bigTree.in_tree?(9) }.from(true).to (false)
      end
      it 'delete the root' do
        expect { tree.insert(5) }.to change { tree.in_tree?(5) }.from(false).to (true)
        expect { tree.delete_value(10) }.to change { tree.in_tree?(10) }.from(true).to (false)
      end
      it 'delete the value between Nodes' do
        expect { tree.insert(3) }.to change { tree.in_tree?(3) }.from(false).to (true)
        expect { tree.insert(1) }.to change { tree.in_tree?(1) }.from(false).to (true)
        expect { tree.delete_value(3) }.to change { tree.in_tree?(3) }.from(true).to (false)
      end
    end
    context 'when deleting with only right value' do
      it 'reduce node count' do
        expect { bigTree.delete_value(3) }.to change { bigTree.return_node_count }.by(-1)
      end
      it 'delete the right value' do
        expect { bigTree.delete_value(3) }.to change { bigTree.in_tree?(3) }.from(true).to (false)
      end
      it 'delete the root' do
        expect { tree.insert(16) }.to change { tree.in_tree?(16) }.from(false).to (true)
        expect { tree.delete_value(10) }.to change { tree.in_tree?(10) }.from(true).to (false)
      end
      it 'delete the value between Nodes' do
        expect { tree.insert(13) }.to change { tree.in_tree?(13) }.from(false).to (true)
        expect { tree.insert(16) }.to change { tree.in_tree?(16) }.from(false).to (true)
        expect { tree.delete_value(13) }.to change { tree.in_tree?(13) }.from(true).to (false)
      end
    end
    context 'when deleting with both values' do
      it 'reduce node count' do
        expect { bigTree.delete_value(6) }.to change { bigTree.return_node_count }.by(-1)
      end
      it 'delete the right value' do
        expect { bigTree.delete_value(6) }.to change { bigTree.in_tree?(6) }.from(true).to (false)
      end
    end
    context 'when deleting root' do
      it 'reduce node count' do
        expect { bigTree.delete_value(6) }.to change { bigTree.return_node_count }.by(-1)
      end
      it 'delete the right value' do
        expect { bigTree.delete_value(6) }.to change { bigTree.in_tree?(6) }.from(true).to (false)
      end
    end
    context 'when deleting value that not exists' do
      it 'do not reduce node count' do
        expect { bigTree.delete_value(2) }.to_not change { bigTree.return_node_count }
      end
    end
    context 'when deleting with no childer' do
      it 'reduce node count' do
        expect { bigTree.delete_value(7) }.to change { bigTree.return_node_count }.by(-1)
      end
      it 'delete the right value' do
        expect { bigTree.delete_value(7) }.to change { bigTree.in_tree?(7) }.from(true).to (false)
      end
    end
  end
  describe '#min/max' do
    it 'max should be defined' do
      expect { bigTree.return_max_in_node }.not_to raise_error
    end
    it 'min should be defined' do
      expect { bigTree.return_min_in_node }.not_to raise_error
    end
    it 'max return good value' do
      expect(bigTree.return_max_in_node).to eq(9)
    end
    it 'min return good value' do
      expect(bigTree.return_min_in_node).to eq(3)
    end
  end
end
