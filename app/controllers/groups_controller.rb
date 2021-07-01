class GroupsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def index
    
  end

  def show
  end

  def new
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def edit
  end
end
