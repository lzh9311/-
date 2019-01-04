class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
      render html:"<h1>hello world</h1>"
  end
end
