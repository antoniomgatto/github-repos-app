class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show]
  before_action :set_repositories, only: [:index]

  def index
  end

  def show
  end

  private
    def set_repository
      @repository = Repository.find(params[:id])
    end

    def set_repositories
      @repositories = Repository.includes(:owner).order(:stargazers_count)
    end
end
