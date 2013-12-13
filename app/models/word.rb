class Word < ActiveRecord::Base

  serialize :specifics, Hash

  # Associations
  belongs_to :user

  # Validations
  validates :foreign_form, presence: true, uniqueness: true
  validates :known_form,   presence: true

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