class FetchGithubRepositoriesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(languages)
    begin
      repositories = []
      languages.each do |language|
        response = FetchGithubRepositoriesService.new({language: language}).perform
        repositories += ResponseParser.new({response: response}).perform
      end
      ImportRepositoriesService.new({repositories: repositories}).perform
      notify(true)
    rescue
      notify(false)
    end
  end

  def notify(success)
    NotifyRepositoriesUpdatedService.new(success: success).perform
  end
end