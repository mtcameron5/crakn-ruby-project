require 'date'
require 'spec_helper'
require_relative '../../lib/1_calculate_age/calculate_age'

RSpec.describe CalculateAge do
  subject(:helper) { described_class }

  context 'with age 01/21/1994 to 06/01/2021' do
    it 'equals 27' do
      expect(helper.calculate(Date.new(1994, 1, 21), Date.new(2021, 6, 1))).to eq 27
    end
  end

  context 'with age 08/20/1989 to 06/01/2021' do
    it 'equals 31' do
      expect(helper.calculate(Date.new(1989, 8, 20), Date.new(2021, 6, 1))).to eq 31
    end
  end

  context 'with age 08/20/1989 to 08/19/1990' do
    it 'equals 0' do
      expect(helper.calculate(Date.new(1989, 8, 20), Date.new(1990, 8, 19))).to eq 0
    end
  end

  context 'with age 08/20/1989 to 08/20/1990' do
    it 'equals 1' do
      expect(helper.calculate(Date.new(1989, 8, 20), Date.new(1990, 8, 20))).to eq 1
    end
  end

  context 'with age 02/29/2000 to 03/1/2001' do
    it 'equals 1' do
      expect(helper.calculate(Date.new(2000, 2, 29), Date.new(2001, 3, 1))).to eq 1
    end
  end

  context 'with age 02/29/2000 to 02/28/2001' do
    it 'equals 0' do
      expect(helper.calculate(Date.new(2000, 2, 29), Date.new(2001, 2, 28))).to eq 0
    end
  end
end
