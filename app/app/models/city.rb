class City < ApplicationRecord
  has_many :hotels

  validates_presence_of :name

  def data
    { name: name, coat_of_arms_url: coat_of_arms_url }
  end
end
