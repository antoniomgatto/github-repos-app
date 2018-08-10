require 'rails_helper'

RSpec.describe RepositoriesController, :type => :request do

  describe "GET #index" do
    it "populates an array of repositories" do
      repository = create(:repository)
      get repositories_path
      expect(assigns(:repositories)).to eq([repository])
    end

    it "render the :index view" do
      get repositories_path
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested repository to @repository" do
       repository = create(:repository)
       get repository_path(id: repository.id)
       expect(assigns(:repository)).to eq(repository)
    end

    it "render the :show view" do
      repository = create(:repository)
      get repository_path(id: repository.id)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #search" do
    it "redirect to index" do
      get search_repositories_path
      expect(response).to redirect_to( '/repositories')
    end
  end
end