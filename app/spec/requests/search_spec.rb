require 'rails_helper'

RSpec.describe '/search', type: :request do
  let(:request) { get('/api/search.json', params: { city: city, q: term }) }
  let(:json_response) { JSON.parse(response.body) }

  context 'when searching for Hotels in Sigulda' do
    let(:city) { 'Sigulda' }

    context 'with a keyword Pils' do
      let(:term) { 'Pils' }
      let(:expected_result) {
        [
          'Pils, 4B, Pils iela, Sigulda, Siguldas novads, Vidzeme, LV-2150, Latvia',
          'Kaķis, 8A, Pils iela, Sigulda, Siguldas novads, Vidzeme, LV-2150, Latvia',
          'Krimuldas pils, 3, Mednieku iela, Krimulda, Sigulda, Siguldas novads, Vidzeme, LV-2150, Latvia',
          'Sigulda, 6, Pils iela, Sigulda, Siguldas novads, Vidzeme, LV-2150, Latvia',
          'Kaķu māja, 8, Pils iela, Sigulda, Siguldas novads, Vidzeme, LV-2150, Latvia',
          'Good Stay Segevold, 4B, Mālpils iela, Sigulda, Siguldas novads, Vidzeme, LV-2150, Latvia'
        ]
      }

      it 'returns result under 100ms' do
        expect(Benchmark.realtime { request }).to be < 0.1 # under 100ms
      end

      it 'returns hotel names' do
        request
        names = json_response.map { |el| el['display_name'] }

        expect(names).to match_array(expected_result)
      end
    end
  end
end
