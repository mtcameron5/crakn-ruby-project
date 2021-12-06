require 'spec_helper'
require_relative '../../lib/3_forgot_tests/journal'

RSpec.describe Journal do
  subject(:journal) { described_class }

  let(:debit1) { Journal::Line.new(10.0) }
  let(:debit2) { Journal::Line.new(6.0) }
  let(:credit1) { Journal::Line.new(8.0, debit: false) }

  describe '#total' do
    context 'with only debit lines' do
      let(:instance) { journal.new(debit1, debit2) }

      it 'returns the correct sum' do
        expect(instance.total).to eq 16.0
      end
    end

    # Write some more specs anywhere in this File
    context 'with credit and debit lines' do
      let(:instance) { journal.new(debit1, debit2, credit1) }

      it 'returns the correct sum' do
        expect(instance.total).to eq 8.0
      end
    end
  end

  describe '#add' do
    context 'starting with 1 line' do
      let(:instance) { journal.new(debit1) }

      it 'starts with correct amount of lines' do
        expect(instance.lines.size).to eq 1
      end

      it 'has the correct amount of lines after adding' do
        instance.add debit2
        expect(instance.lines.size).to eq 2

        instance.add credit1
        expect(instance.lines.size).to eq 3
      end
    end
  end
end
