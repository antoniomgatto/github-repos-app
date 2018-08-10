class SaveGithubRepositoriesService

  def initialize(params)
    @languages = params[:languages]
    @owners = []
    @repositories = []
    @github = Github.new
  end

  def perform
    fetch_repositories
    save_repositories
  end

  private
    def fetch_repositories
      @languages.each do |language|
        result = @github.search.repos q: "language:#{language}", per_page: 10, sort: 'stars', order: 'desc'
        result.items.each do |item|
          @repositories << new_repository(item)
        end
      end
    end

    def repository_params(item)
     item.to_h.slice('node_id', 'name', 'full_name', 'html_url', 'description', 'fork',
        'url', 'pushed_at', 'homepage', 'size', 'created_at', 'updated_at', 'stargazers_count',
        'watchers_count', 'language', 'forks_count', 'open_issues_count')
    end

    def owner_params(item)
      item['owner'].to_h.slice('login','node_id','avatar_url','gravatar_id','url')
    end

    def new_repository(item)
      repository = Repository.new(repository_params(item))
      @owners << repository.build_owner(owner_params(item))
      Rails.logger.debug "repository #{@owners.size}"
      repository
    end

    def save_repositories
      Repository.transaction do
        Owner.import @owners, validate: true
        Repository.record_timestamps = false
        Repository.import @repositories, recursive: true, validate: true
        Repository.record_timestamps = true
      end
    end
end