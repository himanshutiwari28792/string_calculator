require 'string_calculator'

describe StringCalculator do

  subject(:calculator) { described_class.new }

  it 'should accept a string' do
    expect{ calculator.addition('1,2,3') }.not_to raise_error
  end

  it 'should give a desired output' do
    expect{ calculator.addition('1,2,3') }.eql?(6)
  end

  it 'should not accept other data types' do
    expect( calculator.addition(123) ).to eq ('Error- input can be string only')
    expect( calculator.addition(['123']) ).to eq ('Error- input can be string only')
  end

  it 'should return 0 for an empty string' do
    expect(calculator.addition('')).to eq(0)
  end

  it 'should return a number if the passed string contains no delimiters' do
    expect(calculator.addition('123')).to eq (123)
  end

  it 'should return the sum of the numbers, if the passed string contains comma delimiters' do
    expect(calculator.addition('12,34')).to eq(46)
  end

  it 'should return the sum of the numbers, if the passed string contains new line delimiters' do
    expect(calculator.addition("12\n34\n56")).to eq(102)
  end

  it 'should handle multiple random delimiters' do
    expect(calculator.addition("//;\n1;2")).to eq(3)
  end

  it 'should not accept negative numbers' do
    expect( calculator.addition("123,-2") ).to eq ("Error- negative input values -2")
  end

  it 'should not accept multiple negative numbers' do
    expect( calculator.addition("123,-2,-4") ).to eq ("Error- negative input values -2,-4")
  end

end