class Hotel < ApplicationRecord
  belongs_to :city

  validates_presence_of :display_name, :city

  scope :matching_term, -> (term) { where(self.arel_table[:display_name].matches("%#{term}%")) }

  def self.hotels_data
    all.map(&:data)
  end

  def data
    { **attributes, city: city.data }
  end
end
