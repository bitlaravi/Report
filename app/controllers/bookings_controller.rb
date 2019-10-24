class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:create, :edit, :update, :new]
  before_action :set_user
  def index
    @bookings = Booking.all
  end
  def show
  end
  def new
    @booking = Booking.new
  end
  def edit
  end
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end
    def set_users
      @users = User.all
      @Routes = Route.all
      
    end
    def set_user
      @user = User.find_by(id: params[:user_id])
      @Route = Route.find_by(id: params[:route_id])
      
    end

    def booking_params
      params.require(:booking).permit(:user_id, :booking_id_no, :pnr_no, :origin, :destination, :issued_date, :travel_date, :issued_by, :is_canceled, :route, :total_fare)
    end
end
