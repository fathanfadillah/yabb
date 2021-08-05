require_relative './test_helper.rb'
require_relative './increment.rb'

describe IntegerArrayIncrementer do 
    integer = IntegerArrayIncrementer.new 
    
    it 'should return [1] when input is [0]' do
        input = [0]
        expected = [1]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end
    
    it 'should return [1, 0] when input is [9]' do
        input = [9]
        expected = [1, 0]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end

    it 'should return [2, 0] when input is [1, 9]' do
        input = [1,9]
        expected = [2,0]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end

    it 'should return [1,0,0] when input is [9, 9]' do
        input = [9,9]
        expected = [1,0,0]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end

    it 'should return [1,0,1] when input is [1,0,0]' do
        input = [1,0,0]
        expected = [1,0,1]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end

    it 'should return [1,1,0] when input is [1,0,9]' do
        input = [1,0,9]
        expected = [1,1,0]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end

    it 'should return [2,0,0] when input is [1,9,9]' do
        input = [1,9,9]
        expected = [2,0,0]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end

    it 'should return [1,0,0,0,0,0,0] when input is [9,9,9,9,9,9]' do
        input = [9,9,9,9,9,9]
        expected = [1,0,0,0,0,0,0]

        actual = integer.increment(input)
        expect(actual).to eq(expected)
    end
end 