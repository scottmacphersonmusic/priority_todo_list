class TodosController < ApplicationController
  before_action :list, only: [:new, :create, :edit, :update, :destroy]
  before_action :todo, only: [:new, :edit]

  def new
  end

  def create
    @todo = @list.todos.build(todo_params)

    if @todo.save
      flash[:notice] = 'ToDo Successfully Created'
      redirect_to @list
    end
  end

  def edit
  end

  def update
    if todo.update_attributes(todo_params)
      flash[:notice] = 'ToDo Successfully Updated'
      redirect_to @list
    end
  end

  def destroy
    todo.destroy
    flash[:notice] = 'ToDo Successfully Deleted'
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
