task refresh_repository_index: :environment do
  GithubData.refresh_index!
end
