class WelcomeController < ApplicationController
  def index
  end

  def nyan
    # app/views/welcome/nyan.html.erb
    render :action => "nyan"
  end
end
