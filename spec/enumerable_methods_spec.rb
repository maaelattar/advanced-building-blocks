require 'enumerable_methods'

describe Enumerable do
  let(:arr){[1, 2, 3, 8, 7, 4, 5, 6]}
  describe '#my_select' do
    it 'Returns array with elements bigger than 3' do
      expect(arr.my_select { |i| i > 3 }).to eq([8, 7, 4, 5, 6])
    end
  end

  describe '#my_all?' do
    it 'Returns true if all elements are bigger than 3' do
      expect(arr.my_all? { |i| i > 3 }).to eq(false)
    end
    it 'Returns true if all elements are less than 100' do
      expect(arr.my_all? { |i| i < 100 }).to eq(true)
    end
  end

  describe '#my_any?' do
    it 'Returns true if any element is bigger than 3' do
      expect(arr.my_any? { |i| i > 3 }).to eq(true)
    end

    it 'Returns false if all elements are bigger than 0' do
      expect(arr.my_any? { |i| i <= 0 }).to eq(false)
    end
  end

  describe '#my_none?' do
    it 'Returns false if any element equals 5' do
      expect(arr.my_none? { |i| i == 5 }).to eq(false)
    end

    it 'Returns true if all elements does not  equal 0' do
      expect(arr.my_none? { |i| i == 0 }).to eq(true)
    end
  end

  describe '#my_count' do
    it 'Returns array length' do
      expect(arr.my_count).to eq(8)
    end
    it 'Returns number of elements that are bigger than 5' do
      expect(arr.my_count { |i| i > 5 }).to eq(3)
    end
    it 'Returns number of elements that equlas 2' do
      expect(arr.my_count(2)).to eq(1)
    end
  end

  describe '#my_map' do
    it 'Returns a new array of elements multiplied by 2' do
      expect(arr.my_map { |i| i * 2 }).to eq([2, 4, 6, 16, 14, 8, 10, 12])
    end
    it 'Returns a new array of zeros' do
      go_zero = Proc.new { |i| i * 0 }
      expect(arr.my_map(go_zero)).to eq([0, 0, 0, 0, 0, 0, 0, 0])
    end
  end

  describe '#my_inject' do
    it 'Returns the sum of array elements: 36' do
      expect(arr.my_inject { |sum, element| sum + element }).to eq(36)
    end

    it 'Returns the sum of array elements plus 2: 38' do
      expect(arr.my_inject(2) { |sum, element| sum + element }).to eq(38)
    end

  end
end
