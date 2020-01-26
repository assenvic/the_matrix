# frozen_string_literal: true

module Tokenable
  extend ActiveSupport::Concern

  def self.included(base)
    base.extend(ClassMethods)
    base.class_attribute(:token_names)
  end

  module ClassMethods
    def has_unique_token(*args)
      return if args.blank?
      self.token_names = args.uniq
      after_initialize(:set_tokens)
      add_validations(token_names)
    end

    private

    def add_validations(names)
      validates_uniqueness_of(names)
      validates_presence_of(names)
    end
  end

  protected

  def set_tokens
    return unless new_record?
    self.class.token_names.each do |token_name|
      send("#{token_name}=", generate_uniq_token(token_name))
    end
  end

  def generate_uniq_token(token_name)
    loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(token_name => random_token)
    end
  end
end
