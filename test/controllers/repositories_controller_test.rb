require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repository = repositories(:one)
  end

  test "should get index" do
    get repositories_url
    assert_response :success
  end

  test "should get new" do
    get new_repository_url
    assert_response :success
  end

  test "should create repository" do
    assert_difference('Repository.count') do
      post repositories_url, params: { repository: { created_at: @repository.created_at, default_branch: @repository.default_branch, description: @repository.description, fork: @repository.fork, forks_count: @repository.forks_count, full_name: @repository.full_name, homepage: @repository.homepage, html_url: @repository.html_url, language: @repository.language, master_branch: @repository.master_branch, name: @repository.name, node_id: @repository.node_id, open_issues_count: @repository.open_issues_count, private_repo: @repository.private_repo, pushed_at: @repository.pushed_at, score: @repository.score, size: @repository.size, stargazers_count: @repository.stargazers_count, updated_at: @repository.updated_at, url: @repository.url, watchers_count: @repository.watchers_count } }
    end

    assert_redirected_to repository_url(Repository.last)
  end

  test "should show repository" do
    get repository_url(@repository)
    assert_response :success
  end

  test "should get edit" do
    get edit_repository_url(@repository)
    assert_response :success
  end

  test "should update repository" do
    patch repository_url(@repository), params: { repository: { created_at: @repository.created_at, default_branch: @repository.default_branch, description: @repository.description, fork: @repository.fork, forks_count: @repository.forks_count, full_name: @repository.full_name, homepage: @repository.homepage, html_url: @repository.html_url, language: @repository.language, master_branch: @repository.master_branch, name: @repository.name, node_id: @repository.node_id, open_issues_count: @repository.open_issues_count, private_repo: @repository.private_repo, pushed_at: @repository.pushed_at, score: @repository.score, size: @repository.size, stargazers_count: @repository.stargazers_count, updated_at: @repository.updated_at, url: @repository.url, watchers_count: @repository.watchers_count } }
    assert_redirected_to repository_url(@repository)
  end

  test "should destroy repository" do
    assert_difference('Repository.count', -1) do
      delete repository_url(@repository)
    end

    assert_redirected_to repositories_url
  end
end
