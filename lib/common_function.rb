
module CF

  def excel(excel_file_name, work_sheet_name,row,column)
    dir_to_excel = Dir.pwd + '/lib/config/data/'
    $read_workbook = RubyXL::Parser.parse("#{dir_to_excel}#{excel_file_name}")
    $worksheet = $read_workbook["#{work_sheet_name}"]
    $worksheet[row][column].value
  end

  def xl_Data(excel_folder_Name, sheet_Name, column_Number)
    require 'win32ole'
    xl = WIN32OLE.new('excel.application')
    wrkbook= xl.Workbooks.Open(Dir.pwd + '/lib/config/data/'+excel_folder_Name)
    wrksheet= wrkbook.Worksheets(sheet_Name)
    login_data = wrksheet.range("A2:B99").value
    login_data.each do |data|
      row = data[column_Number]
      if row != nil
        return row
      end
    end
    xl.Quit
    system("taskkill /t /f /im Excel.exe")
  end

  $b = [*10..28].sample
# #  wait and visiable for object
# # object =  wait 9 second for  specific object
# #  ErrorMsgDescription = if the object not display, Error message should describe
#  --------------------------------------------------------------------------------------------------------------------------------------
  def objWait(obj)

    @counter = 0

    while obj.exists? == false do
      @counter +=1
      if @counter == 15
        puts  " *** Requested object was not found *** "
        break
      else
        sleep 3
      end

    end

  end

#  --------------------------------------------------------------------------------------------------------------------------------------

  def objRefresh(obj)

    @counter = 0

    while obj.present? == false do
      @counter +=1
      if @counter == 6
        puts  " *** Requested object was not found ***"
        break
      else
        @browser.refresh
        sleep 5
      end
    end
  end

#   ----------------------------------------------------------------------------------------------------------------------------------------------------------

  def objVisiable(obj)

    @counter = 0

    while obj.present? == false && obj.exists == false do
      @counter +=1
      if @counter == 5
        puts  " *** Requested object was not VISABLE  ***"
        break
      else
        sleep 2
      end
    end
  end
#  --------------------------------------------------------------------------------------------------------------------------------------
  def sync_obj(obj,object_Description)

    @counter = 0
     sleep 1
    while obj.exists? == false do
      @counter +=1
      if @counter == 15
        puts  " *** SYNC *** << : #{object_Description} >>"
        break
      else
        sleep 3
      end
    end
    if obj.exists?
      obj.flash
      obj.flash
      obj.flash
    end
  end

#  --------------------------------------------------------------------------------------------------------------------------------------


#  ----------------------------------------------------------------------------------------------------------------------------------------------------------------

#  ---------------------------------------------- #####   MODULE   END HERE  ####### ----------------------------------------------------------------------------------------

end

#  --------------------------------------------------------------------------------------------------------------------------------------
