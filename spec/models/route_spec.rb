# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Route, type: :model) do
  subject { build(:route) }

  include_examples 'a model with a token'

  context 'validations' do
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:start_node) }
    it { should validate_presence_of(:end_node) }

    it 'start_time grater than end_time' do
      subject.start_time = 2.days.from_now
      subject.end_time = 2.days.ago
      expect(subject).not_to be_valid
    end
    
    it 'start_time less than end_time' do
      subject.end_time = 2.days.from_now
      subject.start_time = 2.days.ago
      expect(subject).to be_valid
    end
  end

  context 'enum' do
    it 'start_node' do
      AlphanumericCode::CODES.keys.each do |key|
        subject.start_node = key
        expect(subject).to be_valid  
      end
    end

    it 'end_node' do
      AlphanumericCode::CODES.keys.each do |key|
        subject.start_node = key
        expect(subject).to be_valid  
      end
    end
  end
end
