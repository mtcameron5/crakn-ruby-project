require 'spec_helper'
require_relative '../../lib/2_match_person/person_matcher'

RSpec.describe PersonMatcher do
  subject(:matcher) { described_class }

  let(:dwight1) { { first_name: 'Dwight', middle_name: 'Glenn', last_name: 'Appleton' } }
  let(:dwight2) { { first_name: 'Dwight', middle_name: 'Gerald', last_name: 'Appleton' } }
  let(:autumn) { { first_name: 'Autumn', middle_name: 'Harley', last_name: 'Poole' } }
  let(:noah) { { first_name: 'Noah', middle_name: 'Zaire', last_name: 'Waters' } }

  let(:people) { [dwight1, dwight2, autumn, noah] }
  let(:instance) { matcher.new(*people) }

  context 'with Dwight Appleton' do
    let(:matches) { instance.find_match(first_name: 'Dwight', last_name: 'Appleton') }

    it 'matches both Dwights' do
      puts "Dwight1 is #{dwight1}"
      expect(matches).to include(dwight1, dwight2)
      expect(matches).not_to include(autumn, noah)
    end
  end

  context 'with Dwight Gerald Appleton' do
    let(:matches) { instance.find_match(first_name: 'Dwight', middle_name: 'Gerald', last_name: 'Appleton') }

    it 'matches exactly' do
      expect(matches).to include(dwight2)
      expect(matches).not_to include(autumn, noah, dwight1)
    end
  end

  context 'with no matching name' do
    let(:matches) { instance.find_match(last_name: 'NoMatches') }

    it 'returns empty array' do
      expect(matches).to be_empty
    end
  end

  context 'with empty hash argument' do
    let(:matches) { instance.find_match({}) }

    it 'returns empty array' do
      expect(matches).to be_empty
    end
  end

  context 'with middle name Zaire' do
    let(:matches) { instance.find_match(middle_name: 'Zaire') }

    it 'matches only Noah' do
      puts "Noah is #{noah}"
      expect(matches).to include(noah)
      expect(matches).not_to include(autumn, dwight1, dwight2)
    end
  end

  context 'with last name Poole' do
    let(:matches) { instance.find_match(last_name: 'Poole') }

    it 'matches only Autumn' do
      puts "Autumn is #{autumn}"
      expect(matches).to include(autumn)
      expect(matches).not_to include(noah, dwight1, dwight2)
    end
  end

  context 'when passing String' do
    it 'raises StandardError exception' do
      expect { instance.find_match('Dwight') }.to raise_error(StandardError)
    end
  end
end
