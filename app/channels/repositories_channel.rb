class RepositoriesChannel < ApplicationCable::Channel

  def follow
    stream_from "repositories"
  end

  def unfollow
    stop_all_streams
  end
end