module ApplicationHelper

  def current_year
    time = Time.new
    time.year
  end

  def github_url(author,repo)
    ref = "https://github.com/#{author}/#{repo}"
  end
end
