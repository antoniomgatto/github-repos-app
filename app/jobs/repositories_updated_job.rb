  class RepositoriesUpdatedJob < ApplicationJob
    def perform(success)
      success ? success_action : unsuccess_action
    end

    private

      def success_action
        ActionCable.server.broadcast(
          'repositories',
          html: render_repositories
        )
      end

      def unsuccess_action
        ActionCable.server.broadcast(
          'repositories',
          message: 'Não foi possível completar a importação. Tente novamente ...'
        )
      end

      def render_repositories
        repositories = Repository.includes(:owner).order_by_more_stars
        ApplicationController.render(
          partial: 'repositories/repositories',
          locals: { repositories: repositories }
        )
      end
  end