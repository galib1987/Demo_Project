include SauceLabs
Before do
  ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
  ENV['WHERE'] = "local" if ENV['WHERE'].nil?
  if(ENV['WHERE']=="remote")
    @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym,{url:"http://ondemand.saucelabs.com:80"})
  else
    # @browser = SauceLabs.watir_browser(ENV['BROWSER'].to_sym)
    require 'win32ole'
    wmi = WIN32OLE.connect("winmgmts://")
    processes = wmi.ExecQuery("select * from win32_process")
    ar = processes.each.with_object([]) {|i,a| a << i.name }
    @bName = ENV['BROWSER']
    case @bName
      when 'firefox'
        if ar.include? "firefox.exe"
          system("taskkill /t /f /im firefox.exe")
        end
        @browser = Watir::Browser.new ENV['BROWSER'].to_sym
      when 'ie'
        if ar.include? "iexplore.exe"
           system("taskkill /t /f /im iexplore.exe")
        end
        # @browser = Watir::Browser.new ENV['BROWSER'].to_sym
        ulala = Selenium::WebDriver::Remote::Capabilities.ie(:ignoreProtectedModeSettings => true)
        @browser = Watir::Browser.new  :ie, :desired_capabilities => ulala
      when 'chrome'
        if ar.include? "chrome.exe"
          system("taskkill /t /f /im chrome.exe")
          sleep 2
        end
         @browser = Watir::Browser.new ENV['BROWSER'].to_sym,:switches => %w[--disable-extensions  --ignore-certificate-errors --disable-popup-blocking --disable-translate]
        sleep 2
      when nil
        break
    end
    #   @browser = Watir::Browser.new ENV['BROWSER'].to_sym
  end
  @browser.window.maximize
end


After do |scenario|
  if scenario.failed?
    if ENV['ScreenShot']=="yes"
      Dir::mkdir('ScreenShots') if not File.directory?('ScreenShots')
      screenshot = "./ScreenShots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  end
  @browser.cookies.clear
  @browser.quit
end


at_exit do
  ENV['ARCHIVE_RESULTS'] = 'no' if ENV['ARCHIVE_RESULTS'].nil?
  if ENV['ARCHIVE_RESULTS']=="yes"
    # Dir.mkdir("resultsarchive") if Dir["resultsarchive"].empty?
    test_result="Test Execution Result"
    Dir.mkdir(test_result) if Dir[test_result].empty? # ---Made changes----------------------------
    folder = Dir.pwd
    input_filenames = ['results.html']
    time = Time.now.strftime("%m-%d-%Y")
    time_min = Time.now.strftime("%I.%M_%p")
    # zipfile_name = "Date_#{time}_Time_#{time_min}_Results.zip"
    zipfile_name = "Date_#{time}_#{time_min}_Results.zip"
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, folder + '/' + filename)
        if ENV['Email_Test_Results']=="yes"
          outlook = WIN32OLE.new('Outlook.Application')
          message = outlook.CreateItem(0)
          message.Subject = " TEST EXECUTION RESULTS [ #{time}_#{time_min} ]"
          message.Body = " Please find the attachment for ***  Automated Test Execution Results  *** "
          message.Recipients.Add 'galib.nyc@gmail.com'
          message.Attachments.Add(folder + '/' + filename)
          #Want to save as a draft?
          message.Save
          #Want to send instead?
          message.Send
        end
      end
    end
    FileUtils.mv(zipfile_name, "#{test_result}/#{zipfile_name}")
  end
end



