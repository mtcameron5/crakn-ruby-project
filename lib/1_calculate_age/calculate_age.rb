# frozen_string_literal: true

class CalculateAge
  # Note, method assumes that for a person born on a leap year, (February 29th)
  # there age does not increment until March 1st
  def self.calculate(age_at_birth, age_at_death)
    age = age_at_death.year - age_at_birth.year
    months_difference = age_at_death.month - age_at_birth.month
    # subtract 1 if no birthday was had on year of death
    age -= 1 if months_difference.negative? || (months_difference.zero? &&
      age_at_death.day < age_at_birth.day)

    age
  end
end
