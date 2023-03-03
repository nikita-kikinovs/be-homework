require 'uri'
require 'net/http'

namespace :fetch_data do
  desc 'Fetch hotels of a specific cities'
  task update_specific_city_hotels: :environment do
    processed_ids = []
    City.all.each do |city|
      uri = URI("https://nominatim.openstreetmap.org/search?q=Hotels+in+#{city.name}&accept-language=en&format=json")
      res = Net::HTTP.get_response(uri)

      @results = res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body) : []

      @results.each do |result|
        processed_ids << Hotel.find_or_create_by!(city: city, display_name: result['display_name']).id
      end
    end

    Hotel.where.not(id: processed_ids).destroy_all
  end
end
