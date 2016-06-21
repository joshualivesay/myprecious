class SchedulersController < ApplicationController
  before_action :set_scheduler, only: [:show, :update, :destroy, :create]

  # GET /schedulers
  def index
    @schedulers = if params[:except].blank?
                    Scheduler.all
                  else
                    Scheduler.exclude(URI.unescape(params[:except]).upcase).active
                  end

    render json: @schedulers, root: false
  end

  # POST /schedulers
  def create
    scheduler = params[:scheduler]
    if @scheduler
        @scheduler.touch
        @scheduler.update({:location => URI.unescape(scheduler[:location]).upcase, :sleep => scheduler[:sleep]})
    else
      @scheduler = Scheduler.new({:location => URI.unescape(scheduler[:location]).upcase, :sleep => scheduler[:sleep]})
    end

    if @scheduler.save
      render json: @scheduler, status: :created, location: @scheduler
    else
      render json: @scheduler.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduler
      puts "\n\n---------------------------------- NEW TRANSACTION -----------------------------------------------"
      @scheduler = Scheduler.find_by_location(URI.unescape(params[:scheduler][:location]).upcase)
    end

    # Only allow a trusted parameter "white list" through.
    def scheduler_params
      params.require(:scheduler).permit(:location, :active, :sleep)
    end


end
