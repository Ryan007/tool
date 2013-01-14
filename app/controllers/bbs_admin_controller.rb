class BbsAdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @customers = BbsAdmin.where('dateline' => time_range).paginate(:page => params[:page], :per_page => 20)
    
    respond_to do |format|
      format.html
    end
  end

  def admin
  	# time_range = (Time.now.midnight - 1.day)..Time.now.midnight
  	# @admins = BbsAdmin.where('dateline' => time_range).group("uid")
  	# @bbs = BbsAdmin.where('dateline' => time_range)

    if !params[:start_date].nil? 
      if !params[:start_date].empty?
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        time_range = ((@t.midnight + 1.second) - 1.day)..@t.midnight
      else
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end

    @admins = BbsAdmin.where('dateline' => time_range).group("uid")
    @bbs = BbsAdmin.where('dateline' => time_range)
    respond_to do |format|
      format.html # index.html.erb
    end

  end
# 'OPN' => 'CLS',#关闭
# 'ECL' => 'CLS', 
# 'UEC' => 'CLS', 
# 'EOP' => 'CLS',
# 'USR' => 'CLS', 
# 'UEO' => 'CLS',
# ['OPN', 'ECL', 'UEC', 'EOP', 'USR', 'UEO', 'CLS']

# 'UDG' => 'DIG',#加入精华
# 'EDI' => 'DIG', 
# 'UED' => 'DIG', 
# ['UDG', 'EDI','UED','DIG']

# 'UST' => 'STK',#置顶 
# 'EST' => 'STK',	
# 'UES' => 'STK',
# 'BMP' => 'STK',
# ['UST', 'EST', 'UES', 'BMP', 'STK']


# 'DLP' => 'DEL',	#删除
# 'PRN' => 'DEL',	
# 'UDL' => 'DEL',	
# ['DLP', 'PRN', 'UDL', 'DEL']

# 'UHL' => 'HLT',	# 高亮显示
# 'EHL' => 'HLT',	
# 'UEH' => 'HLT',
# ['UHL', 'EHL', 'UEH', 'HLT']

# 'SPL' => 'MRG', 

# 'ABL' => 'EDT', #编辑 ['ABL', 'EDT', 'RBL']
# 'RBL' => 'EDT'

# 'MOV' 移动
# 'TYP' 分类
# 'BNP'屏蔽
# 'URE' 接触推荐
# 'REC' 推荐

end

