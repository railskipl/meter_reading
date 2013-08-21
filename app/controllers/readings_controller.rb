class ReadingsController < ApplicationController

 before_filter  :authenticate ,:only => [:edit,:update,:index,:create,:new]


  # GET /dtc_staffs
  # GET /dtc_staffs.json
  def index
    @readings = Reading.all
  end

  # GET /dtc_staffs/1
  # GET /dtc_staffs/1.json
  def show
    @reading = Reading.find(params[:id])
  end

  # GET /dtc_staffs/new
  def new
    @reading = Reading.new
  end

  # GET /dtc_staffs/1/edit
  def edit
    @reading  = Reading.find(params[:id])
  end

  # POST /dtc_staffs
  # POST /dtc_staffs.json
  def create
    if params[:device] == 'mobile' 

     

   @reading = Reading.create(:meter_reading=>params[:meter_reading],:consumer_no=>params[:consumer_no],:pc =>params[:pc],:pincode =>params[:pincode],:bu =>params[:bu],:address=>params[:address],:city=>params[:city],:consumer_name=> params[:consumer_name],:dtc =>params[:dtc],:pole_no =>params[:pole_no],:reader_mobile_no=>params[:reader_mobile_no],:date_time=>params[:date_time],:latitude=>params[:latitude],:longitude =>params[:longitude],:ime_no=>params[:ime_no],:image=>params[:image],
    :meter_status=>params[:meter_status],:old_meter_no=>params[:old_meter_no],:new_meter_no=>params[:new_meter_no],:bill_month=>params[:bill_month],:meter_reader_status=>params[:meter_reader_status],:remark=>params[:remark],:read_by=>params[:read_by])
   
     

       render :status =>200,:json => { :error => "valid" } 
      else
        render :status =>401,:json => { :error => "Invalid" } 
      end
   
    
  end


  def redis
  redis = Redis.new(:url => '192.168.1.167:6379')
   msg = { 'class' => 'Reading', 'args' => [1, 2, 3], 'retry' => true }
   redis.lpush("namespace:queue:default", JSON.dump(msg))


  end 
   
  # PATCH/PUT /dtc_staffs/1
  # PATCH/PUT /dtc_staffs/1.json
  def update
    respond_to do |format|
      if @reading.update(params[:reading])
        format.html { redirect_to @reading, notice: 'Dtc staff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dtc_staffs/1
  # DELETE /dtc_staffs/1.json
  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url }
      format.json { head :no_content }
    end
  end
 
  
    # Use callbacks to share common setup or constraints between actions.
 private
  def authenticate
    deny_access unless signed_in?
  end  


end
