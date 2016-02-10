class LanguagesController < ApplicationController
  def show
    @repos_by_month = Repository.repos_by_month(language: params[:id])
    gon.years = @repos_by_month.map {|row| Time.parse(row["date_trunc"]).strftime("%b %Y") }
    gon.repos = @repos_by_month.map {|row| row["count"].to_i }
    gon.language = params[:language]
  end
end
