class SentGiftsController < ApplicationController
  def index
    @sent_gifts = SentGift.all
  end

  def show
    @sent_gift = SentGift.find(params[:id])
  end

  def new
    @sent_gift = SentGift.new
  end

  def create
    @sent_gift = SentGift.new
    @sent_gift.content = params[:content]
    @sent_gift.purpose = params[:purpose]
    @sent_gift.date = params[:date]
    @sent_gift.image_url = params[:image_url]

    if @sent_gift.save
      redirect_to "/sent_gifts", :notice => "Sent gift created successfully."
    else
      render 'new'
    end

    @recipient = Recipient.new
    @recipient.sent_gift_id = @sent_gift.id
    @recipient.person_id = params[:person_id]
    @recipient.save
  end

  def first_recipient
    @sent_gift = SentGift.new
    @sent_gift.content = params[:content]
    @sent_gift.purpose = params[:purpose]
    @sent_gift.date = params[:date]
    @sent_gift.image_url = params[:image_url]
    if @sent_gift.save
      @recipient = Recipient.new
      @recipient.sent_gift_id = @sent_gift.id
      @recipient.person_id = params[:person_id]
      @recipient.save
      redirect_to "/sent_gifts/#{@sent_gift.id}/edit"
    else
      render 'new', :alert => "Date must be filled in."
    end
  end

  def new_recipient
    @sent_gift = SentGift.find(params[:id])
    @sent_gift.content = params[:content]
    @sent_gift.purpose = params[:purpose]
    @sent_gift.date = params[:date]
    @sent_gift.image_url = params[:image_url]
    if @sent_gift.save
      @recipient = Recipient.new
      @recipient.sent_gift_id = @sent_gift.id
      @recipient.person_id = params[:person_id]
      @recipient.save
      redirect_to "/sent_gifts/#{@sent_gift.id}/edit"
    else
      render 'new'
    end
  end

  def remove_recipient
    @sent_gift = SentGift.find(params[:sent_gift_id])
    @sent_gift.content = params[:content]
    @sent_gift.purpose = params[:purpose]
    @sent_gift.date = params[:date]
    @sent_gift.image_url = params[:image_url]
    if @sent_gift.save
      Recipient.all.each do |recipient|
        if recipient.sent_gift_id == params[:sent_gift_id].to_i && recipient.person_id == params[:person_id].to_i
          recipient.destroy
        end
      end
      redirect_to "/sent_gifts/#{@sent_gift.id}/edit"
    else
      render 'new'
    end
  end
  
  def edit
    @sent_gift = SentGift.find(params[:id])
  end

  def update
    @sent_gift = SentGift.find(params[:id])
    @sent_gift.content = params[:content]
    @sent_gift.purpose = params[:purpose]
    @sent_gift.date = params[:date]
    @sent_gift.image_url = params[:image_url]

    if @sent_gift.save
      redirect_to "/sent_gifts", :notice => "Sent gift updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @sent_gift = SentGift.find(params[:id])

    @sent_gift.destroy

    redirect_to "/sent_gifts", :notice => "Sent gift deleted."
  end
end
