
require 'simplecov'
SimpleCov.start

require 'node'

RSpec.describe 'node.rb' do
  describe '#constructor' do
    it 'should be defined' do
      expect { BinaryTree::Node.new(10) }.not_to raise_error
    end
  end
end
