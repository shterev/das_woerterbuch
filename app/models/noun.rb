class Noun < Word

  define_specifics :grammatical_gender, :plural

  def noun?
    true
  end

end