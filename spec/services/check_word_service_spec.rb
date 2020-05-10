require 'rails_helper'

describe CheckWordService do
  let(:service) { described_class }

  context 'valid word' do
    let(:valid_word) { 'valid' }

    it 'should return positive' do
      expect(described_class.call(word: valid_word).valid?).to be_truthy
    end
  end

  context 'invalid word' do
    let(:invalid_word) { 'invalid.word' }

    it 'should return false' do
      expect(described_class.call(word: invalid_word).valid?).to be_falsey
    end
  end
end
