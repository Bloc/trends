task debug_environment: :environment do
  logger           = Logger.new(STDOUT)
  logger.level     = Logger::DEBUG
  Rails.logger     = logger
end

task refresh_repository_index: :debug_environment do
  GithubData.refresh_index!
end

task refresh_repositories: :debug_environment do
  GithubData.refresh_repositories!
end
