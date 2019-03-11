class TodosController < ApplicationController
  def new
    render :new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
      if @todo.save
        flash[:errors] = ["Todo was created successfully!"]
        redirect_to todo_url(@todo)
      else
        flash.now[:errors] = @todo.errors.full_messages
        render :new
    end
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
