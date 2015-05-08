require 'geocoder'

Spree::StockLocation.class_eval do
    extend Geocoder::Model::ActiveRecord

    geocoded_by :address
    after_validation :geocode
end
