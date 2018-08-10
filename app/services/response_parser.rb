class ResponseParser

  def initialize(params)
    @response = params[:response]
  end

  def perform
    parse_data
  end

  private
    def parse_data
      repositories = []
      @response.items.each do |item|
        repositories << new_repository(item)
      end
      repositories
    end

    def repository_params(item)
     item.to_h.slice('node_id', 'name', 'full_name', 'html_url', 'description', 'fork',
        'url', 'pushed_at', 'homepage', 'size', 'created_at', 'updated_at', 'stargazers_count',
        'watchers_count', 'language', 'forks_count', 'open_issues_count')
    end

    def owner_params(item)
      item['owner'].to_h.slice('login','node_id','avatar_url','gravatar_id','html_url','url')
    end

    def new_repository(item)
      repository = Repository.new(repository_params(item))
      repository.build_owner(owner_params(item))
      repository
    end
end