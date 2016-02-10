class RepositoriesController < ApplicationController
  def index
    @total_indexed_count  = Repository.all.count
    @fresh_count          = Repository.fresh.count
    @repositories         = Repository.fresh.order("created_at DESC").limit(1_000)
  end
end
