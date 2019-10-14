class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    ##@meetings = Meeting.all
    @meetings = Meeting.where(users_id: current_user.id)
    ##@meeting.users_id=current_user.id
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    ###@yoyakudates=[1,8,22,29] 

    set_hizuke

    #stime = @meeting.start_time
    #stime2 = stime.to_i + 30
    #@meeting.end_time = stime2
    
  end

  # GET /meetings/1/edit
  def edit
    set_hizuke
    ##@meeting = Meeting.find(params[:id])
    @old_date = @meeting.start_time.strftime("%Y-%m-%d")

    #binding.pry
    ##set_hizuke
  end

  


  # POST /meetings
  # POST /meetings.json
  def create
    ###@meeting = Meeting.new(meeting_params)
    ##date=params[:meeting][:start_date]
    #binding.pry
    @meeting = Meeting.new(meeting_params)
    @meeting.users_id=current_user.id

    sdate = DateTime.parse(params[:meeting][:start_date])
    sdatestr = sprintf("%d-%d-%d %d:%d:%d", sdate.year, sdate.month, sdate.day, @meeting.start_time.hour, @meeting.start_time.min, @meeting.start_time.sec)
    ##binding.pry
    @meeting.start_time = sdatestr
    @meeting.end_time = @meeting.start_time + 1800
    #binding.pry

    # 料金を入金テーブルから予約列に移動
    fee=Fee.find_by(level: current_user.level_kakuteis_id, style: current_user.lesson_styles_id)
    ryoukin=fee.kingaku / fee.style
    nyukin=Nyukin.find_by(users_id: current_user.id)
    if !nyukin.nil?  && !nyukin.zandaka.nil? && nyukin.zandaka >= ryoukin 
      if nyukin.yoyakukin.nil?
        nyukin.yoyakukin=ryoukin
      else
        nyukin.yoyakukin+=ryoukin
      end

      nyukin.zandaka-=ryoukin
      nyukin.save

      # 入金履歴の更新
      rireki=NyukinRireki.new
      rireki.users_id=current_user.id
      rireki.nyukin_shubetsus_id=3
      rireki.itu=DateTime.now
      rireki.kingaku=ryoukin
      rireki.save

      respond_to do |format|
        if @meeting.save
          format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
          format.json { render :show, status: :created, location: @meeting }
        else
          format.html { render :new }
          format.json { render json: @meeting.errors, status: :unprocessable_entity }
        end
      end

    else
      #flash.now[:danger] = '予約金が足りません'
      redirect_to :usergamen, danger: "予約金が足りません"
    end

  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update

    @meeting.name=meeting_params[:name]
    @meeting.description=meeting_params[:description]
    sdate = DateTime.parse(params[:meeting][:start_date])
    #sdatestr = sprintf("%d-%d-%d %d:%d:%d", sdate.year, sdate.month, sdate.day, @meeting.start_time.hour, @meeting.start_time.min, @meeting.start_time.sec)
    #sdatestr = sprintf("%d-%d-%d %d:%d:00", sdate.year, sdate.month, sdate.day, params[:meeting][:start_time(4i)], params[:meeting][:start_time(5i)])
    sdatestr = sprintf("%d-%d-%d %d:%d:00", sdate.year, sdate.month, sdate.day, params[:meeting]["start_time(4i)"], params[:meeting]["start_time(5i)"])
    @meeting.start_time = sdatestr
    @meeting.end_time = @meeting.start_time + 1800
    #binding.pry
    respond_to do |format|
      #if @meeting.update(meeting_params)
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :description, :start_time, :end_time)
      #params.permit(:name, :description, :start_time, :end_time)
    end

    def set_hizuke
      require "date"

      d = Date.today
      while d.wday != 2 do
        d += 1
      end

      @yoyaku = []
      for i in 0..7 do
        ##@yoyaku[i] = {'name' => d.strftime("%Y年 %m月 %d日"), "value" => d.strftime("%Y-%m-%d")}
        ###@yoyaku[i] = {:name => d.strftime("%Y年 %m月 %d日"), :value => d.strftime("%Y-%m-%d")}
        @yoyaku[i] = [d.strftime("%Y年 %m月 %d日"), d.strftime("%Y-%m-%d")]
        ##@yoyaku[i] = d.strftime("%d")

        d += 7
      end    
    end 
end
