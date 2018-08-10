class FetchGithubRepositoriesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(languages)
    success = SaveGithubRepositoriesService.new({languages: languages}).perform
    notify(success)
  end

  def notify(success)
    NotifyRepositoriesUpdatedService.new(success: success).perform
  end
end