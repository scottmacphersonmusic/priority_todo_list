class TodosController < ApplicationController
  before_action :list, only: [:new, :create, :edit, :update, :destroy]
  before_action :todo, only: [:new, :edit]

  def new
  end

  def create
    @todo = @list.todos.build(todo_params)

    if @todo.save
      flash[:success] = 'ToDo Successfully Created'
      redirect_to @list
    else
      flash.now[:error] = 'There was a problem creating your ToDo'
      render :new
    end
  end

  def edit
  end

  def update
    if todo.update_attributes(todo_params)
      flash[:success] = 'ToDo Successfully Updated'
      redirect_to @list
    else
      flash.now[:error] = 'There was a problem updating your ToDo'
      render :edit
    end
  end

  def destroy
    todo.destroy
    flash[:success] = 'ToDo Successfully Deleted'
    redirect_to @list
  end

  private

  def todo_params
    params.require(:todo).permit(:body, :priority)
  end

  def list
    @list = List.find(params[:list_id])
  end

  def todo
    @todo ||= params[:id] ? Todo.find(params[:id]) : @list.todos.build
  end
end
