class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
  
    # GET /todos
    def index
      @todos = [
        { id: 1, title: 'test1', completed: false },
        { id: 2, title: 'test2', completed: false }
      ]
  
      render json: @todos
    end
  
    # GET /todos/:id
    def show
      render json: @todo
    end
  



    # << Not working because the project doesn't have a database >>
    # POST /todos
    def create
      @todo = { id: params[:id], title: params[:title], completed: false }
      render json: @todo, status: :created
    end
  
    # PUT /todos/:id
    def update
      @todo[:title] = params[:title] if params[:title]
      @todo[:completed] = params[:completed] if params[:completed]
      render json: @todo
    end
  
    # DELETE /todos/:id
    def destroy
      render json: { message: 'Todo deleted' }
    end
  
    private
  
    def set_todo
      @todos = [
        { id: 1, title: 'test1', completed: false },
        { id: 2, title: 'test2', completed: false }
      ]
      @todo = @todos.find { |todo| todo[:id] == params[:id].to_i }
    end
  end
  