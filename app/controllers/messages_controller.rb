class MessagesController < ApplicationController
  def new

  end

  def create
		@message = Message.new(message_params)

    respond_to do |format|
      if @message.save
       	puts "提交成功"
        format.html { redirect_to root_url }
      end
    end
	end

	private

		def message_params
			params.require(:message).permit(:name, :tel)
		end
end
