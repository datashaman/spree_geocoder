require 'geocoder'

Spree::Address.class_eval do
    extend Geocoder::Model::ActiveRecord

    geocoded_by :address
    after_validation :geocode

    def address
        [ address1, address2, city, state_text, country.name ].compact.join(', ')
    end

    reverse_geocoded_by :latitude, :longitude, :address => :location
    after_validation :reverse_geocode
end
