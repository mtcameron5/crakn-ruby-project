# frozen_string_literal: true

# PersonMatcher class: instantiate object by passing in hash of people, with first_name,
# middle_name, and/or last_name as keys. #find_match takes hash as argument, returns an
# array of people (hash objects) based on argument.
class PersonMatcher
  attr_reader :people

  def initialize(*people)
    @people = people
  end

  # Method requires a hash is given as an argument
  def find_match(names_hash)
    raise StandardError, 'must pass a hash as an argument' unless names_hash.is_a? Hash

    result = []
    return result if names_hash.keys.empty?

    people.each do |person|
      result << person if names_match?(names_hash, person)
    end
    result
  end

  private

  def names_match?(names_hash, person)
    names_hash.each_key do |name|
      return false unless names_hash[name] == person[name]
    end
    true
  end
end
