# frozen_string_literal: true

shared_examples 'a model with a token' do
  describe '.new' do
    let(:token_names) { subject.class.token_names }

    it 'validate uniquness' do
      token_names.each do |name|
        should validate_uniqueness_of(name)
      end
    end

    it 'validate presence' do
      token_names.each do |name|
        should validate_presence_of(name)
      end
    end

    it "create a #{name} after init" do
      token_names.each do |name|
        expect(subject.send(name).empty?).to(be_falsy)
      end
    end

    it "the #{name} is unique" do
      token_names.each do |name|
        expect(subject.class.exists?("#{name} = #{subject.send(name)}")).to(be_falsy)
      end
    end
  end
end
