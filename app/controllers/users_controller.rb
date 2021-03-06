class UsersController < ApplicationController
  def new
    require 'date'

    @user = User.new
    @user.lesson_kaisu = 0
    @user.join_date = Date.today
    @user.lesson_nobekaisu = 0
    @user.firstname = '太郎'
    @user.lastname = '漢字'
    @user.kanji_name = '漢字　太郎'
    @user.name_kana = 'カンジ　タロウ'
    @user.email = 'vmak8160@gmail.com'
    @user.email2 = 'ha_arcadia66@yahoo.co.jp'
    @user.age = '15'
    @user.address = '名古屋市中区栄三丁目１１番地'
    @user.zip_code = '460-0008'
    @user.mobile_phone = '090-1234-5689'
    @user.emagency_phone = '080-1234-7890'
    @user.emagency_name = '漢字　総一郎'
    @user.emagency_kana = 'カンジ　ソウイチロウ'
    @user.emagency_zokugara = '祖父'
    

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
    
  end

  def carddata
    @amount=params[:amount]
    @payjp_pk=ENV.fetch("PAYJP_PK")
    ###binding.pry
    if params[:amount]=="" || params[:amount].nil?
      ##redirect_to 
      #binding.pry
      puts "error"
      flash.now[:danger] = "入力に不備があります。登録に失敗しました"
      render :paymenttest
    else 
      ###binding.pry
      #redirect_to :usergamen
      #render :usergamen
      #redirect_to carddata
      #@amount=params[:amount]
      render :carddata
      #redirect_to :usergamen
    end
  end


  def confirm
    #  確認画面作る
    @user = User.new(user_params)

    if @user.valid?
      @password=user_params[:password]
      render :confirm
    else
      flash.now[:danger] = "入力に不備があります。登録に失敗しました"
      render :new
    end
    
  end

  def usergamen
    @meetings = Meeting.where(users_id: current_user.id)
  end

  def usershow 
    ##binding.pry
    @user = User.find(current_user.id)
    
  end

  def pay
    # cookieから金額を読み込んで金額ammount:に入れる
    #Payjp.api_key = 'Payjp の画面から取得した秘密鍵'
    ##binding.pry
      
    ## 金額チェック
    ##binding.pry
    if params[:amount] == "" || params[:amount].nil?
      flash.now[:danger] = "入力に不備があります。登録に失敗しました"
      puts "error"
      redirect_to :paymenttest and return
    else 
      #binding.pry
      Payjp.api_key =ENV.fetch("PAYJP_SK")
      Payjp::Charge.create(
      #amount: params[:amount], # 決済する値段
      ##amount: cookies['kingaku'].to_i,
      amount: params[:amount].to_i,
      card: params['payjp-token'],
      currency: 'jpy'
      )
      ## 入金が成功したら表示
      ###flash.now[:success] = "入金に成功しました"
      ## 成功していたら入金データに記録
      ## 入金テーブル更新
      nyukin=Nyukin.find_by(users_id: current_user.id)
      #binding.pry
      if nyukin.nil? 
        nyukin=Nyukin.new
        nyukin.users_id=current_user.id
      end
      #binding.pry
      if nyukin.zandaka.nil?
        nyukin.zandaka=params[:amount].to_i
      else
        nyukin.zandaka+=params[:amount].to_i
      end
      nyukin.save

      # 入金履歴の更新
      rireki=NyukinRireki.new
      rireki.users_id=current_user.id
      rireki.nyukin_shubetsus_id=1
      rireki.itu=DateTime.now
      rireki.kingaku=params[:amount].to_i
      rireki.save

      ## ユーザ画面に戻る ,入金が成功したら表示
      ##redirect_to :usergamen and return
      redirect_to :usergamen, success: "入金に成功しました"
    end
    
  end

  def payment
    
    #binding.pry
    @amount=params[:amount]
    @payjp_pk=ENV.fetch("PAYJP_PK")
    binding.pry
    ##render :payment
  end

  def paymenttest
    
    #binding.pry
    @amount=params[:amount]
    @payjp_pk=ENV.fetch("PAYJP_PK")
    ##binding.pry
    ##render :payment
  end



  def kingaku
    ###render :payment

  end

  private
  ##def user_params
  ##  params.require(:user).permit(:username, :email)
  ##end
  def user_params
    ##params.require(:user).permit(:username, :email, :password, :password_confirmation)
    params.require(:user).permit(:username, :email, :address, :lesson_styles_id,
                                 :level_kibous_id, :level_kakuteis_id, :fee_howtos_id, :pinano_owned_id, :pinano_histories_id,
                                 :kanji_name, :name_kana, :firstname, :lastname, :email2, :age, :zip_code, 
                                 :mobile_phone, :emagency_phone, :emagency_name, :emagency_kana, 
                                 :emagency_zokugara, :lesson_kaisu, :lesson_nobekaisu, :join_date,
                                 :password, :password_confirmation)
  end
end

