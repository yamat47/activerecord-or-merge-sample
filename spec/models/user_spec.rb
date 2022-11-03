require 'rails_helper'

RSpec.describe User do
  let!(:merchant) { Guild.create(name: 'Merchant') }
  let!(:craft) { Guild.create(name: 'Craft') }

  let!(:taro) { merchant.users.create(name: 'Taro', age: 16) }
  let!(:hanako) { merchant.users.create(name: 'Hanako', age: 17) }
  let!(:jiro) { craft.users.create(name: 'Jiro', age: 18) }
  let!(:saburo) { craft.users.create(name: 'Saburo', age: 19) }

  before do
    hanako.parental_consent_logs.create(consented_at: Time.current)
  end

  describe '.adult_or_parental_consented' do
    context 'when scope is used with another condition' do
      subject { described_class.where(guild: craft).adult_or_parental_consented }

      it { is_expected.to contain_exactly(jiro, saburo) }
    end

    context 'when scope is used without another condition' do
      subject { described_class.adult_or_parental_consented }

      it { is_expected.to contain_exactly(hanako, jiro, saburo) }
    end
  end

  describe '.merge_unused_adult_or_parental_consented' do
    context 'when scope is used with another condition' do
      subject { described_class.where(guild: craft).merge_unused_adult_or_parental_consented }

      # This example unexpectedly fails.
      it { is_expected.to contain_exactly(jiro, saburo) }
    end

    context 'when scope is used without another condition' do
      subject { described_class.merge_unused_adult_or_parental_consented }

      it { is_expected.to contain_exactly(hanako, jiro, saburo) }
    end
  end
end
