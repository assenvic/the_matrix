# frozen_string_literal: true

class Route < ApplicationRecord
  # Concerns
  include Tokenable
  has_unique_token :passphrase

  # Validations
  validates :start_node, :end_node, :start_time, :end_time, presence: true
  validate :possible_time_range?

  # scopes

  # Class methods
  enum start_node: AlphanumericCode::CODES, _prefix: :start_node
  enum start_node: AlphanumericCode::CODES, _prefix: :end_node

  # instance methods
  private

  def possible_time_range?
    return if [start_time.blank?, end_time.blank?].any?
    if start_time > end_time
      errors.add(:end_time, 'must be greater than or equal start_time')
      errors.add(:start_time, 'must be less than or equal end_time')
    end
  end
end
