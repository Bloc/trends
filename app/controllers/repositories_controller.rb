class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.limit(10000).all
  end
end
