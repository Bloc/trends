class RepositoriesController < ApplicationController
  def index
    @total_indexed_count  = Repository.all.count
    @fresh_count          = Repository.fresh.count
    @repositories         = Repository.fresh.order("created_at DESC").limit(1_000)
  end

  def show
    db = Repository.connection
    @repos_by_month = db.execute("SELECT date_trunc('month', created_at), COUNT(*) FROM repositories WHERE last_synced_at IS NOT NULL GROUP BY 1 ORDER BY 1")
    gon.years = @repos_by_month.map {|row| Time.parse(row["date_trunc"]).strftime("%b %Y") }
    gon.repos = @repos_by_month.map {|row| row["count"].to_i }
  end
end
