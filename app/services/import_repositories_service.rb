class ImportRepositoriesService

  def initialize(params)
    @repositories = params[:repositories]
  end

  def perform
    collect_owners
    save
  end

  private
    def collect_owners
      @owners = @repositories.collect(&:owner)
    end

    def save
      Repository.transaction do
        Owner.import @owners, validate: true
        Repository.record_timestamps = false
        Repository.import @repositories, recursive: true, validate: true
        Repository.record_timestamps = true
      end
    end
end