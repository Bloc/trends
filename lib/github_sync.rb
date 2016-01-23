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
end
