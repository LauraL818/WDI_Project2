class EntriesController < ApplicationController
  before_action :correct_entry, only: [:show, :edit, :update]

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(entry_params)
      redirect_to entry_path(@entry)
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    if @entry.destroy
      redirect_to user_path(@entry.user)
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :body, :date, :avatar,:stadium_id, stadium_attributes: [:id, :name])
  end
end
