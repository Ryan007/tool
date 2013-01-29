# encoding: utf-8
class ClickMailer < ActionMailer::Base
  default :from => "noreply@xiaoma.com"

  @@arr = []
  def send_traffic(recipient)
    # # 先生成excel文件
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    puts time_range
    @yd = Time.now - 1.day
    @@arr = []
    traverse_dir("#{Rails.root}/download/triffs/")
    # 计算总的点击次数 uv
    @count_clicks = Click.where('record_date' => time_range).sum("clicks")

    if !@@arr.include?"#{@yd.strftime('%Y-%m-%d')}-Campaign.xls"
        export_click_xls(@count_clicks, Click, @yd)
    end
    
    @recipients = recipient
    @from = 'noreply@xiaoma.com'
    @subject = "流量数据统计表"
    
    attachments["广告位统计#{@yd.strftime('%Y-%m-%d')}.xls"] = File.read("#{Rails.root}/download/triffs/#{@yd.strftime('%Y-%m-%d')}-Click.xls")

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

  private  
	    # 导出流量数据
	    def export_click_xls(count_all, model, yd)
	    	time_range = (Time.now.midnight - 1.day)..Time.now.midnight

		    @click_pages = Click.where('record_date' => time_range).group("page")
		    @pages = Click.where('record_date' => time_range)
		    @click_cams = Click.where('record_date' => time_range).group("campaign")

		    
		    count_row = 0
		    count_col = 0
		    xls_report = StringIO.new  
		    book = Spreadsheet::Workbook.new

		    sheet1 = book.create_worksheet :name => "根据页面显示" 
		    sheet2 = book.create_worksheet :name => "根据活动显示"
		        
		    blue = Spreadsheet::Format.new :color => :blue, :weight => :bold
		    sheet1.row(0).default_format = blue
		    sheet2.row(0).default_format = blue  
		      
		    sheet1[0, 0] = '页面'
		    sheet1[0, 1] = '位置'
		    sheet1[0, 2] = '分类'
		    sheet1[0, 3] = '父分类'
		    sheet1[0, 4] = '活动'
		    sheet1[0, 5] = '点击量'

		    sheet1[1, 5] = count_all
		    count_row = count_row + 2
		    
			@click_pages.each do |obj|
				@pages.where("page = #{obj.page}").order("clicks DESC").each do |page|
					sheet1[count_row, 0] = WebPage.find(page.page).content
				    sheet1[count_row, 1] = Position.find(page.position).name
				    sheet1[count_row, 2] = TagCategory.find(page.up_category).name
				    sheet1[count_row, 3] = TagCategory.find(page.category).name
				    sheet1[count_row, 4] = Campaign.find(page.campaign).name
				    sheet1[count_row, 5] = page.clicks
				    count_row = count_row + 1
				end
			end
			
			sheet2[0, 0] = '活动'
			sheet2[0, 1] = '页面'
		    sheet2[0, 2] = '位置'
		    sheet2[0, 3] = '分类'
		    sheet2[0, 4] = '父分类'
		    sheet2[0, 5] = '点击量'

		    sheet2[1, 5] = count_all
		    count_row = 2

			@click_cams.each do |obj|
				@pages.where("campaign = #{obj.campaign}").order("clicks DESC").each do |page|
					sheet2[count_row, 0] = Campaign.find(page.campaign).name
					sheet2[count_row, 1] = WebPage.find(page.page).content
				    sheet2[count_row, 2] = Position.find(page.position).name
				    sheet2[count_row, 3] = TagCategory.find(page.up_category).name
				    sheet2[count_row, 4] = TagCategory.find(page.category).name
				    sheet2[count_row, 5] = page.clicks
				    count_row = count_row + 1
				end
			end

			filepath=Rails.root+"download/triffs/#{(yd).strftime('%Y-%m-%d')}-#{model}.xls" 
			book.write filepath
			xls_report.string
		end

end
