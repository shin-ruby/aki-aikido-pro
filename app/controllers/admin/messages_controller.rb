module Admin
  class MessagesController < Admin::ApplicationController
    before_action :logged_in_user

    def index
      @messages = Message.all
    end

    def show
      @message = Message.find(params[:id])
    end

  end
end
