require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_presence_of(:city) }
  end

  describe '#data' do
    let(:city) { City.create(name: 'Riga', coat_of_arms_url: "https://example.com/Riga.png") }
    let(:hotel) { Hotel.create(city: city, display_name: 'Viesnicas nosaukums') }
    subject { hotel.data }

    it 'should return hotel data' do
      expect(subject).to match({ "id" => hotel.id,
                                 "display_name" => "Viesnicas nosaukums",
                                 "city_id" => city.id,
                                 "created_at" => instance_of(ActiveSupport::TimeWithZone),
                                 "updated_at" => instance_of(ActiveSupport::TimeWithZone),
                                 :city => { :name => "Riga", :coat_of_arms_url => "https://example.com/Riga.png"}})
    end
  end
end
