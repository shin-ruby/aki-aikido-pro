module Admin
	class HomeController < Admin::ApplicationController
    before_action :logged_in_user
    
	  def show
	  end

	end
end