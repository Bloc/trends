task refresh_repository_index: :environment do
  logger           = Logger.new(STDOUT)
  logger.level     = Logger::DEBUG
  Rails.logger     = logger

  GithubData.refresh_index!
end
