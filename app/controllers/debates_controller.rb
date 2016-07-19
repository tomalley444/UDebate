class DebatesController < ApplicationController
  def show
  end

  def create
  end

  def edit
  end

  def index
    @debates=Debate.all
  end
end
