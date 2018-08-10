class NotifyRepositoriesUpdatedService

  def initialize(params)
    @success = params[:success]
  end

  def perform
    RepositoriesUpdatedJob.perform_later(@success)
  end
end
