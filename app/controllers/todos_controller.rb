class TodosController < ApplicationController
  
  before_action :set_todo, only:[:show, :edit, :update, :destroy]
  
  
  def index 
    @todos = Todo.all
    render :index
  end
  
  
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
   render :show
  end
  
  def edit
    render :edit
  end
  
  def update
    if @todo.update_attributes(todo_params)
      flash[:errors] = ["Todo was successfully updated"]
      redirect_to todo_url(@todo)
    else
      flash.now[:errors] = @todo.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @todo.destroy
    flash[:errors] = ["successfully deleted"]
    redirect_to todos_url
  end
  
  private
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
  def set_todo
     @todo = Todo.find(params[:id])
  end
end
