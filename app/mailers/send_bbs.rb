# encoding: utf-8
class SendBbs < ActionMailer::Base
  default :from => "noreply@xiaoma.com"

  @@arr = []
  def core_customer_mailer(recipient)
    # # 先生成excel文件
    time_range = (Time.now.midnight - 1.day)..(Time.now.midnight - 0.day)
    @yd = Time.now - 1.day
    @@arr = []
    traverse_dir("#{Rails.root}/download/bbs/core/")


    if !@@arr.include?"#{@yd.strftime('%Y-%m-%d')}-BbsCoreCustomer.xls"
        @bbs = BbsCoreCustomer.where('current_date' => time_range).where('bbs_type IS NULL')
        export_xls(@bbs, BbsCoreCustomer, @yd)
    end

    @recipients = recipient
    @from = 'noreply@xiaoma.com'
    @subject = "BBS核心用户统计表"
    attachments["BBS核心用户统计表#{@yd.strftime('%Y-%m-%d')}.xls"] = File.read("#{Rails.root}/download/bbs/core/#{@yd.strftime('%Y-%m-%d')}-BbsCoreCustomer.xls")

    mail(:to => "#{recipient}", :subject => @subject)
  end

  def bbs_admin_mailer(recipient)
    # # 先生成excel文件
    time_range = (Time.now.midnight - 1.day)..(Time.now.midnight - 0.day)
    @yd = Time.now - 1.day
    @@arr = []
    traverse_dir("#{Rails.root}/download/bbs/admin/")


    if !@@arr.include?"#{@yd.strftime('%Y-%m-%d')}-BbsAdmin.xls"
        @admins = BbsAdmin.where('dateline' => time_range).group("uid").order("uid DESC")
        @bbs = BbsAdmin.where('dateline' => time_range)
        export_admin_xls(@admins, @bbs, BbsAdmin, @yd)
    end

    @recipients = recipient
    @from = 'noreply@xiaoma.com'
    @subject = "BBS管理员工作统计表"
    attachments["BBS管理员工作统计表#{@yd.strftime('%Y-%m-%d')}.xls"] = File.read("#{Rails.root}/download/bbs/admin/#{@yd.strftime('%Y-%m-%d')}-BbsAdmin.xls")

    mail(:to => "#{recipient}", :subject => @subject)
  end


  # 查询目录下面的文件
  def traverse_dir(file_path)
      if File.directory? file_path
          Dir.foreach(file_path) do |file|
              if file !="." and file !=".."
                  traverse_dir(file_path+"/"+file)
              end
          end
      else
          @@arr << "#{File.basename(file_path)}"
      end
  end

  # 导出流量数据
  def export_xls(objs, model, yd)
    count_row = 0
    count_col = 0
    xls_report = StringIO.new  
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "core_customers"  
      
    @cols = model.column_names

    @cols.each do |col| 
      if col == "clicks"
        sheet1[count_row, count_col] = "uv"
        sheet1[count_row + 1, count_col] = count_click
      else
        sheet1[count_row, count_col] = col
      end
      count_col = count_col + 1
    end

    
    count_row = count_row + 2
    count_col = 0

    objs.each do |obj|
      @cols.each do |col| 
        sheet1[count_row,count_col]=obj["#{col}"]
        count_col = count_col + 1
      end
      count_col = 0 
      count_row = count_row + 1
    end

    filepath=Rails.root+"download/bbs/core/#{(yd).strftime('%Y-%m-%d')}-#{model}.xls" 
    book.write filepath
    xls_report.string
  end 


  # 导出管理员工作的数据
  def export_admin_xls(objs, bbs, model, yd)
    count_row = 0
    count_col = 0
    xls_report = StringIO.new  
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "bbs_admin"  
      
    @cols = ['时间','用户id','名称','编辑','删除','加入精华','关闭','置顶','设置高亮','移动','分类','屏蔽帖子','推荐',
'解除推荐','合计']
    @cols.each do |col| 
        sheet1[count_row, count_col] = col
        count_col = count_col + 1
    end

    count_row = count_row + 1
    count_col = 0


    objs.each do |obj|
      @arr = []
      @bbs_admins = bbs.where("uid=?", "#{obj['uid']}")
      @bbs_admins.each do |bb|
        @arr << bb.modaction
      end

      sheet1[count_row, 0]=obj['dateline']
      sheet1[count_row, 1]=obj['uid']
      sheet1[count_row, 2]=obj['username']

        edt = ['ABL', 'EDT', 'RBL']&@arr
        if !edt.empty? 
            if edt.size == 1
                sheet1[count_row, 3]=@bbs_admins.where("modaction = '#{edt[0]}'").sum("`count`")
            elsif edt.size ==2
                sheet1[count_row, 3]=@bbs_admins.where("modaction in ('#{edt[0]}','#{edt[1]}')").sum("`count`")
            elsif edt.size == 3
                sheet1[count_row, 3]=@bbs_admins.sum("`count`")
            end
        else
            sheet1[count_row, 3]=''
        end

        del = ['DLP', 'PRN', 'UDL', 'DEL']&@arr
        if !del.empty?
            if del.size == 1
                puts @bbs_admins.where("modaction in ('#{del[0]}')").sum("`count`")
                sheet1[count_row, 4] = @bbs_admins.where("modaction in ('#{del[0]}')").sum("`count`")
            elsif del.size == 2
                puts "----#{@bbs_admins.where("modaction in ('#{del[0]}', '#{del[1]}')").sum("`count`").class}---"
                sheet1[count_row, 4] = @bbs_admins.where("modaction in ('#{del[0]}', '#{del[1]}')").sum("`count`")
            elsif del.size == 3
                sheet1[count_row, 4] = @bbs_admins.where("modaction in ('#{del[0]}', '#{del[1]}', '#{del[2]}')").sum("`count`")
            elsif del.size == 4
                sheet1[count_row, 4] = @bbs_admins.sum("`count`")
            end
        else
            sheet1[count_row, 4] = ''
        end

        great = ['UDG', 'EDI','UED','DIG']&@arr
        if !great.empty?
            if great.size == 1
                sheet1[count_row, 5] = @bbs_admins.where("modaction in ('#{great[0]}')").sum("`count`")
            elsif great.size == 2
                sheet1[count_row, 5] = @bbs_admins.where("modaction in ('#{great[0]}', '#{great[1]}')").sum("`count`")
            elsif great.size == 3
                sheet1[count_row, 5] = @bbs_admins.where("modaction in ('#{great[0]}', '#{great[1]}', '#{great[2]}')").sum("`count`")
            elsif great.size == 4
                sheet1[count_row, 5] = @bbs_admins.sum("`count`")
            end
        else
            sheet1[count_row, 5] = ''
        end

        cls = ['OPN', 'ECL', 'UEC', 'EOP', 'USR', 'UEO', 'CLS']&@arr
        if !cls.empty?
            if cls.size == 1
                sheet1[count_row, 6] = @bbs_admins.where("modaction in ('#{cls[0]}')").sum("`count`")
            elsif cls.size == 2
                sheet1[count_row, 6] = @bbs_admins.where("modaction in ('#{cls[0]}', '#{cls[1]}')").sum("`count`")
            elsif cls.size == 3
                sheet1[count_row, 6] = @bbs_admins.where("modaction in ('#{cls[0]}', '#{cls[1]}', '#{cls[2]}')").sum("`count`")
            elsif cls.size == 4
                sheet1[count_row, 6] = @bbs_admins.where("modaction in ('#{cls[0]}', '#{cls[1]}', '#{cls[2]}','#{cls[3]}')").sum("`count`")
            elsif cls.size == 5
                sheet1[count_row, 6] = @bbs_admins.where("modaction in ('#{cls[0]}', '#{cls[1]}', '#{cls[2]}', '#{cls[3]}', '#{cls[4]}')").sum("`count`")
            elsif cls.size == 6
                sheet1[count_row, 6] = @bbs_admins.where("modaction in ('#{cls[0]}', '#{cls[1]}', '#{cls[2]}','#{cls[3]}', '#{cls[4]}','#{cls[5]}')").sum("`count`")
            elsif cls.size == 7
                sheet1[count_row, 6] = @bbs_admins.sum("`count`")
            end
        else
            sheet1[count_row, 6] = ''
        end

        top = ['UST', 'EST', 'UES', 'BMP', 'STK']&@arr
        if !top.empty?
            if top.size == 1
                sheet1[count_row, 7] = @bbs_admins.where("modaction in ('#{top[0]}')").sum("`count`")
            elsif top.size == 2
                sheet1[count_row, 7] = @bbs_admins.where("modaction in ('#{top[0]}', '#{top[1]}')").sum("`count`")
            elsif top.size == 3
                sheet1[count_row, 7] = @bbs_admins.where("modaction in ('#{top[0]}', '#{top[1]}', '#{top[2]}')").sum("`count`")
            elsif top.size == 4
                sheet1[count_row, 7] = @bbs_admins.where("modaction in ('#{top[0]}', '#{top[1]}', '#{top[2]}', '#{top[3]}')").sum("`count`")
            elsif top.size == 5
                sheet1[count_row, 7] = @bbs_admins.sum("`count`")
            end
        else
            sheet1[count_row, 7] = ''
        end

        hl = ['UHL', 'EHL', 'UEH', 'HLT']&@arr
        if !hl.empty?
            if hl.size == 1
                sheet1[count_row, 8] = @bbs_admins.where("modaction in ('#{hl[0]}')").sum("`count`")
            elsif hl.size == 2
                sheet1[count_row, 8] = @bbs_admins.where("modaction in ('#{hl[0]}', '#{hl[1]}')").sum("`count`")
            elsif hl.size == 3
                sheet1[count_row, 8] = @bbs_admins.where("modaction in ('#{hl[0]}', '#{hl[1]}', '#{hl[2]}')").sum("`count`")
            elsif hl.size == 4
                sheet1[count_row, 8] = @bbs_admins.sum("`count`")
            end
        else
            
        end

        mv = ['MOV']&@arr
        if !mv.empty?
            sheet1[count_row, 9] = @bbs_admins.sum("`count`")
        else
            sheet1[count_row, 9] = ''
        end

        tp = ['TYP']&@arr
        if !tp.empty?
            sheet1[count_row, 10] = @bbs_admins.sum("`count`")
        else
            sheet1[count_row, 10] = ''
        end

        bp = ['BNP']&@arr
        if !bp.empty?
            sheet1[count_row, 11] = @bbs_admins.sum("`count`")
        else
            sheet1[count_row, 11] = ''
        end

        rc = ['REC']&@arr
        if !rc.empty?
            sheet1[count_row, 12] = @bbs_admins.sum("`count`")
        else
            sheet1[count_row, 12] = ''
        end

        ur = ['URE']&@arr
        if !ur.empty?
            sheet1[count_row, 13] = @bbs_admins.sum("`count`")
        else
            sheet1[count_row, 13] = ''
        end

        sheet1[count_row, 14] = @bbs_admins.sum("`count`")

        count_row = count_row + 1
    end

    filepath=Rails.root+"download/bbs/admin/#{(yd).strftime('%Y-%m-%d')}-#{model}.xls" 
    book.write filepath
    xls_report.string
  end 


end

