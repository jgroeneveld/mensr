class ActionsController < ApplicationController
  def index
    @actions = Action.order('updated_at DESC').limit(25)
  end
end
