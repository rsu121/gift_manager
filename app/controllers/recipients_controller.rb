class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.all
  end

  def show
    @recipient = Recipient.find(params[:id])
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new
    @recipient.person_id = params[:person_id]
    @recipient.sent_gift_id = params[:sent_gift_id]

    if @recipient.save
      redirect_to "/recipients", :notice => "Recipient created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipient = Recipient.find(params[:id])
  end

  def update
    @recipient = Recipient.find(params[:id])

    @recipient.person_id = params[:person_id]
    @recipient.sent_gift_id = params[:sent_gift_id]

    if @recipient.save
      redirect_to "/recipients", :notice => "Recipient updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recipient = Recipient.find(params[:id])

    @recipient.destroy

    redirect_to "/recipients", :notice => "Recipient deleted."
  end
end
