class ReceivedGiftsController < ApplicationController
  def index
    @received_gifts = current_user.received_gifts
  end

  def show
    @received_gift = ReceivedGift.find(params[:id])
  end

  def new
    @received_gift = ReceivedGift.new
  end

  def create
    @received_gift = ReceivedGift.new
    @received_gift.content = params[:content]
    @received_gift.purpose = params[:purpose]
    @received_gift.date = params[:date]
    @received_gift.image_url = params[:image_url]
    @received_gift.user_id = params[:user_id]

    if @received_gift.save
      redirect_to "/received_gifts", :notice => "Received gift created successfully."
    else
      render 'new'
    end

    @sender = Sender.new
    @sender.received_gift_id = @received_gift.id
    @sender.person_id = params[:person_id]
    @sender.user_id = params[:user_id]
    @sender.save
  end

  def first_sender
    @received_gift = ReceivedGift.new
    @received_gift.content = params[:content]
    @received_gift.purpose = params[:purpose]
    @received_gift.date = params[:date]
    @received_gift.image_url = params[:image_url]
    @received_gift.user_id = params[:user_id]
    if @received_gift.save
      @sender = Sender.new
      @sender.received_gift_id = @received_gift.id
      @sender.person_id = params[:person_id]
      @sender.user_id = params[:user_id]
      @sender.save
      redirect_to "/received_gifts/#{@received_gift.id}/edit"
    else
      render 'new', :alert => "Date must be filled in."
    end
  end

  def new_sender
    @received_gift = ReceivedGift.find(params[:id])
    @received_gift.content = params[:content]
    @received_gift.purpose = params[:purpose]
    @received_gift.date = params[:date]
    @received_gift.image_url = params[:image_url]
    @received_gift.user_id = params[:user_id]
    if @received_gift.save
      @sender = Sender.new
      @sender.received_gift_id = @received_gift.id
      @sender.person_id = params[:person_id]
      @sender.user_id = params[:user_id]
      @sender.save
      redirect_to "/received_gifts/#{@received_gift.id}/edit"
    else
      render 'new'
    end
  end

  def remove_sender
    @received_gift = ReceivedGift.find(params[:received_gift_id])
    @received_gift.content = params[:content]
    @received_gift.purpose = params[:purpose]
    @received_gift.date = params[:date]
    @received_gift.image_url = params[:image_url]
    @received_gift.user_id = params[:user_id]
    if @received_gift.save
      current_user.senders.each do |sender|
        if sender.received_gift_id == params[:received_gift_id].to_i && sender.person_id == params[:person_id].to_i
          sender.destroy
        end
      end
      redirect_to "/received_gifts/#{@received_gift.id}/edit"
    else
      render 'new'
    end
  end

  def edit
    @received_gift = ReceivedGift.find(params[:id])
  end

  def update
    @received_gift = ReceivedGift.find(params[:id])
    @received_gift.content = params[:content]
    @received_gift.purpose = params[:purpose]
    @received_gift.date = params[:date]
    @received_gift.image_url = params[:image_url]
    @received_gift.user_id = params[:user_id]
    if @received_gift.save
      redirect_to "/received_gifts", :notice => "Received gift updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @received_gift = ReceivedGift.find(params[:id])

    @received_gift.destroy

    redirect_to "/received_gifts", :notice => "Received gift deleted."
  end
end
