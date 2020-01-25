# frozen_string_literal: true

Rails.application.routes.draw do
  mount Api => '/api'
  mount GrapeSwaggerRails::Engine => '/api/the_matrix/docs'
end
