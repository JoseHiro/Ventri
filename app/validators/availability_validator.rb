class AvailabilityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    rentals = Rental.all
    date_ranges = rentals.map { |rental| rental.start_date..rental.end_date }

    date_ranges.each do |range|
      if range.include?(value)
        record.errors.add(attribute, "The car is not available within this time frame")
      end
    end
  end
end
