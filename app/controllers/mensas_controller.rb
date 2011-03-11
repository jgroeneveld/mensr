class MensasController < ApplicationController
  # GET /mensas/1
  # GET /mensas/1.xml
  def show
    @mensa = Mensa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mensa }
    end
  end
end
