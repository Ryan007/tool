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
        @bbs = BbsCoreCustomer.where('current_date' => time_range)
        export_xls(@bbs, BbsCoreCustomer, @yd)
    end

    @recipients = recipient
    @from = 'noreply@xiaoma.com'
    @subject = "BBS核心用户统计表"
    attachments["BBS核心用户统计表#{@yd.strftime('%Y-%m-%d')}.xls"] = File.read("#{Rails.root}/download/bbs/core/#{@yd.strftime('%Y-%m-%d')}-BbsCoreCustomer.xls")

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



end

