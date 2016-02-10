class LandingController < ApplicationController
  def homepage
    js_repos      = Repository.repos_by_month(language: "JavaScript")
    ruby_repos    = Repository.repos_by_month(language: "Ruby")
    python_repos  = Repository.repos_by_month(language: "Python")

    gon.years   = ruby_repos.map {|row| Time.parse(row["date_trunc"]).strftime("%b %Y") }
    gon.series  = [
      { name: "JavaScript", data: js_repos.map {|row| row["count"].to_i }, color: "#3498db" },
      { name: "Ruby",       data: ruby_repos.map {|row| row["count"].to_i }, color: "#e74c3c" },
      { name: "Python",     data: python_repos.map {|row| row["count"].to_i }, color: "#9b59b6" }
    ]
  end
end
