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

  def self.specifics
    @specifics
  end

  def self.define_specifics(*specifics)
    @specifics = specifics

    specifics.each do |specific|
      define_method(specific) do
        self.specifics[specific]
      end
      define_method("#{specific}=") do |value|
        self.specifics[specific] = value
      end
    end
  end
end