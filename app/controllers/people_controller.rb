class PeopleController < ApplicationController
  def index
    @people = current_user.people
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new
    @person.phonenumber = params[:phonenumber]
    @person.address = params[:address]
    @person.birthday = params[:birthday]
    @person.name = params[:name]
    @person.image_url = params[:image_url]
    @person.user_id = params[:user_id]

    if @person.save
      redirect_to "/people", :notice => "Person created successfully."
    else
      render 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    @person.phonenumber = params[:phonenumber]
    @person.address = params[:address]
    @person.birthday = params[:birthday]
    @person.name = params[:name]
    @person.image_url = params[:image_url]
    @person.user_id = params[:user_id]

    if @person.save
      redirect_to "/people", :notice => "Person updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])

    @person.destroy

    redirect_to "/people", :notice => "Person deleted."
  end
end
