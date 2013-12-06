class Noun < Word

  def noun?
    true
  end

  def grammatical_gender
    self.specifics[:grammatical_gender]
  end

  def grammatical_gender=(value)
    self.specifics[:grammatical_gender] = value
  end

  def plural
    self.specifics[:plural]
  end

  def plural=(value)
    self.specifics[:plural] = value
  end

end