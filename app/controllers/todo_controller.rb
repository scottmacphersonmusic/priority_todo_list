class TodoController < ApplicationController
  def index
    @todos = Todo.all
  end
end
