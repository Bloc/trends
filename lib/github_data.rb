class GithubData
  def self.connection(&block)
    github_token  = GithubToken.claim!
    connection    = Github.new basic_auth: github_token.basic_auth_string

    yield connection
  ensure
    github_token.unclaim! if github_token
  end

  def self.refresh_index!
    if last_repository = Repository.order("created_at DESC").first
      options = { since: last_repository.github_id }
    else
      options = {}
    end

    self.connection do |github|
      github.repos.list(:every, options).each_page do |page|
        page.each do |repo|
          repository = Repository.find_or_create_by(github_id: repo.id)
          repository.update_attributes({
            name: repo.name,
            owner: repo.owner.login,
            full_name: repo.full_name,
            description: repo.description,
            html_url: repo.html_url,
            api_url: repo.url,
            fork: repo.fork,
          })
        end
      end
    end
  end

  def self.refresh_repositories!
    self.connection do |github|
      Repository.not_fork.stale.find_each do |repo|
        user, name = repo.full_name.split("/")

        github_repo =  github.repos.get(user: user, repo: name)
        repo.update_attributes({
          created_at: github_repo.created_at,
          watchers_count: github_repo.watchers_count,
          subscribers_count: github_repo.subscribers_count,
          forks: github_repo.forks,
          open_issues_count: github_repo.open_issues_count,
          network_count: github_repo.network_count,
          owner: github_repo.owner.login,
          size: github_repo.size,
          language: github_repo.language,
          last_synced_at: Time.now
        })
      end
    end
  end
end
