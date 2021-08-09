module ApplicationHelper
  def current_time
    Time.now.year
  end
  def git_url(author_name, author, pr_name)
    link_to("Исходный код проекта: #{pr_name}, автор: #{author_name}", "https://github.com/#{author}/#{pr_name}", target: "_blank")
  end
  def school_url(adress)
    link_to("Школа Thinknetica","#{adress}", target: "_blank")
  end
end
