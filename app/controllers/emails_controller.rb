require 'faker'

class EmailsController < ApplicationController
  def index
  end

  def create
    @email = Email.new(object:Faker::TvShows::Friends.location, body:Faker::TvShows::Friends.quote, read: false)
    if @email.save 
      respond_to do |format|
        format.html {
         redirect_to root_path
         flash[:notice] = "Email created"
        }
        format.js { }
      end
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read: false)
    respond_to do |format|
      format.html {
       redirect_to root_path
      }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { }
      format.js { }
    end    
  end

  def destroy
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html {
       redirect_to root_path
       flash[:notice] = "Email deleted"
      }
      format.js { }
    end
    @email.destroy
  end
end
