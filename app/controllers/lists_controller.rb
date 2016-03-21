class ListsController < ApplicationController
  before_action :list, only: [:new, :show, :edit]

  def index
    @lists = List.all
  end

  def new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:success] = 'List Successfully Created'
      redirect_to @list
    else
      flash.now[:error] = 'There was a problem creating your list'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if list.update_attributes(list_params)
      flash[:success] = 'List Successfully Updated'
      redirect_to list
    else
      flash.now[:error] = 'There was a problem updating your list'
      render :edit
    end
  end

  def destroy
    list.destroy
    flash[:success] = 'List Successfully Deleted'
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit :name
  end

  def list
    @list ||= params[:id] ? List.find(params[:id]) : List.new
  end
end
