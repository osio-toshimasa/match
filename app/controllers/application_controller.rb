class ApplicationController < ActionController::API
  include ::ActionController::Caching
  self.cache_store = :memory_store


end
