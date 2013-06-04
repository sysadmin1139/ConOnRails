class SchedulesController < ApplicationController
  respond_to :html

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create params[:schedule]

    respond_with @schedule, location: schedules_path
  end

  def edit
    @schedule = Schedule.find params[:id]
  end

  def update
    @schedule = Schedule.find params[:id]
    @schedule.update_attributes params[:schedule]
    respond_with @schedule, location: schedules_path
  end

  def show
    @schedule = Schedule.find params[:id]
    @date = params[:date] || @schedule.from
  end

  def new_position
    @schedule = Schedule.find params[:id]
    @position = @schedule.positions.build
  end
end
