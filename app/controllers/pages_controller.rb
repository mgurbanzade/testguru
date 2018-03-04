class PagesController < ApplicationController

  def about
    @thinknetica_url = 'http://thinknetica.com/'
    @author_path = '/about/author'
  end

  def author
    @github_url = 'https://github.com/mgurbanzade'
  end
end
