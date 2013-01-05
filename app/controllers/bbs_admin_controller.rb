class BbsAdminController < ApplicationController
  def index
  end

  def admin
  	time_range = (Time.now.midnight - 1.day)..Time.now.midnight
  	@admins = BbsAdmin.where('dateline' => time_range).group("uid")
  end
# 'OPN' => 'CLS',#close 
# 'ECL' => 'CLS', 
# 'UEC' => 'CLS', 
# 'EOP' => 'CLS',
# 'USR' => 'CLS', 
# 'UEO' => 'CLS',
# ['OPN', 'ECL', 'UEC', 'EOP', 'USR', 'UEO', 'CLS']
# 'UDG' => 'DIG',#加入精华
# 'EDI' => 'DIG', 
# 'UED' => 'DIG', 
# 'UST' => 'STK',#置顶 
# 'EST' => 'STK',	
# 'UES' => 'STK',
# 'BMP' => 'STK',
# 'DLP' => 'DEL',	#删除
# 'PRN' => 'DEL',	
# 'UDL' => 'DEL',	
# 'UHL' => 'HLT',	# 高亮显示
# 'EHL' => 'HLT',	
# 'UEH' => 'HLT',
# 'SPL' => 'MRG', 
# 'ABL' => 'EDT', #编辑
# 'RBL' => 'EDT'
# 'MOV' 移动
# 'TYP' 分类
# 'BNP'屏蔽
# 'URE' 接触推荐
# 'REC' 推荐



end

