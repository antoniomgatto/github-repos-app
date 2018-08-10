class FetchGithubRepositoriesService

  def initialize(params)
    @language = params[:language]
  end

  def perform
    fetch_repositories
  end

  private
    def github_api
      Github.new
    end

    def fetch_repositories
      github_api.search.repos q: "language:#{@language}", per_page: 10, sort: 'stars', order: 'desc'
    end
end