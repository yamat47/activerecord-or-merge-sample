require 'rails_helper'

RSpec.describe User do
  describe '.adult_or_parental_consented' do
    let!(:taro) { User.create(name: 'Taro', age: 16) }
    let!(:hanako) { User.create(name: 'Hanako', age: 17) }
    let!(:jiro) { User.create(name: 'Jiro', age: 18) }
    let!(:saburo) { User.create(name: 'Saburo', age: 19) }

    before do
      hanako.parental_consent_logs.create(consented_at: Time.current)
    end

    subject { described_class.adult_or_parental_consented }

    it { is_expected.to contain_exactly(hanako, jiro, saburo) }
  end

  describe '.merge_unused_adult_or_parental_consented' do
    let!(:taro) { User.create(name: 'Taro', age: 16) }
    let!(:hanako) { User.create(name: 'Hanako', age: 17) }
    let!(:jiro) { User.create(name: 'Jiro', age: 18) }
    let!(:saburo) { User.create(name: 'Saburo', age: 19) }

    before do
      hanako.parental_consent_logs.create(consented_at: Time.current)
    end

    subject { described_class.merge_unused_adult_or_parental_consented }

    it { is_expected.to contain_exactly(hanako, jiro, saburo) }
  end
end
