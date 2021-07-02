class GroupsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def index
    @book = Book.new
    @group = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end
end
