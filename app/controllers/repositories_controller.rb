class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show]
  before_action :set_repositories, only: [:index]
  before_action :destroy_all,:fetch_repositories, only: [:search]

  def index
  end

  def show
  end

  def search
    redirect_to repositories_path, notice: "Estamos buscando os repositórios no Github. Aguarde ..."
  end

  private
    def set_repository
      @repository = Repository.find(params[:id])
    end

    def set_repositories
      @repositories = Repository.includes(:owner).order_by_more_stars
    end

    def destroy_all
      Repository.destroy_all
    end

    def fetch_repositories
      FetchGithubRepositoriesWorker.perform_async(['ruby','java','javascript','php','groovy'])
    end
end
