class GithubSync
  def self.update_index!
    github = Github.new basic_auth: "choxi:a8abf7e501e9dcfa4e8bd2dd7759989bd3788504"
    github.repos.list(:every).each_page do |page|
      page.each do |repo|
        repository = Repository.find_or_create_by(github_id: repo.id)
        repository.update_attributes({
          name: repo.name,
          full_name: repo.full_name,
          description: repo.description,
          html_url: repo.html_url,
          api_url: repo.url,
          fork: repo.fork,
        })
      end

      sleep 5
    end
  end

  def self.update_repos!
    github = Github.new basic_auth: "choxi:a8abf7e501e9dcfa4e8bd2dd7759989bd3788504"

    Repository.find_each do |repo|
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
        language: github_repo.language
      })
    end
  end
end
