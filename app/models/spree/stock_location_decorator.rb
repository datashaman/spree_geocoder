require 'geocoder'

Spree::StockLocation.class_eval do
    extend Geocoder::Model::ActiveRecord
    include OwnedModel

    geocoded_by :address
    after_validation :geocode

    def address
        [ address1, address2, city, state_text, country.name ].compact.join(', ')
    end

    reverse_geocoded_by :latitude, :longitude, :address => :location
    after_validation :reverse_geocode
end
