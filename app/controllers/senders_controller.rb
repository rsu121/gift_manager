class SendersController < ApplicationController
  def index
    @senders = Sender.all
  end

  def show
    @sender = Sender.find(params[:id])
  end

  def new
    @sender = Sender.new
  end

  def create
    @sender = Sender.new
    @sender.person_id = params[:person_id]
    @sender.received_gift_id = params[:received_gift_id]

    if @sender.save
      redirect_to "/senders", :notice => "Sender created successfully."
    else
      render 'new'
    end
  end

  def edit
    @sender = Sender.find(params[:id])
  end

  def update
    @sender = Sender.find(params[:id])

    @sender.person_id = params[:person_id]
    @sender.received_gift_id = params[:received_gift_id]

    if @sender.save
      redirect_to "/senders", :notice => "Sender updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @sender = Sender.find(params[:id])

    @sender.destroy

    redirect_to "/senders", :notice => "Sender deleted."
  end
end
