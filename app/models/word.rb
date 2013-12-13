class Word < ActiveRecord::Base

  serialize :specifics, Hash

  belongs_to :user

  def adjective?
    false
  end

  def adverb?
    false
  end

  def conjunction?
    false
  end

  def interjunction?
    false
  end

  def noun?
    false
  end

  def preposition?
    false
  end

  def pronoun?
    false
  end

  def verb?
    false
  end

end