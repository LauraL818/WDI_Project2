class EntriesController < ApplicationController
  # before_action :authorize, only: [:edit, :update]
  # before_action :correct_user, only: [:show, :new, :create, :edit, :update]

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to entries_path
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
      redirect_to entries_path
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :body, :date, :avatar)
  end
end
