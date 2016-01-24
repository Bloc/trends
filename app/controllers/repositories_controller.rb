class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.limit(10000).all
  end

  def show
    db = Repository.connection
    @repos_by_year = db.execute("SELECT date_trunc('day', created_at), COUNT(*) FROM repositories GROUP BY 1")
  end
end
