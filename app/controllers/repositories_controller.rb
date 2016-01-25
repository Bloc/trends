class RepositoriesController < ApplicationController
  def index
    @total_indexed_count  = Repository.all.count
    @fresh_count          = Repository.fresh.count
    @repositories         = Repository.fresh.order("created_at DESC").limit(1_000)
  end

  def show
    @repos_by_month = Repository.repos_by_month(language: params[:language])
    gon.years = @repos_by_month.map {|row| Time.parse(row["date_trunc"]).strftime("%b %Y") }
    gon.repos = @repos_by_month.map {|row| row["count"].to_i }
    gon.language = params[:language]
  end
end
