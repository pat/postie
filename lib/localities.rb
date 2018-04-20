require "csv"

class Localities
  PATH = File.expand_path "../db/localities.csv", __dir__

  def initialize
    @localities = CSV.read(PATH, :headers => true).collect do |row|
      Locality.new row
    end
  end

  def by_postcode(postcode)
    localities.select { |locality| locality.postcode == postcode }
  end

  def by_suburb(suburb)
    suburb = suburb.downcase

    localities.select { |locality| locality.suburb.downcase[suburb] }
  end

  private

  attr_reader :localities
end
