require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  let(:city) { City.create(name: 'Riga', coat_of_arms_url: "https://example.com/Riga.png") }

  describe '#data' do
    subject { city.data }

    it 'should return city data' do
      expect(subject).to match({ name: city.name, coat_of_arms_url: city.coat_of_arms_url })
    end
  end
end
