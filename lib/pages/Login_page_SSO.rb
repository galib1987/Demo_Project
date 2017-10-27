class Login_Page < GenericBasePage

  include CF


  element(:userName) { |b| b.text_field(id: "IDToken1") }
  element(:password) { |b| b.text_field(id: "IDToken2") }
  element(:submit_Button) { |b| b.button(name: "Login.Submit") }
  element(:submit_Button_error) { |b| b.button(title: "Login using a different account") }
  element(:logoutBtn) { |b| b.link(text: "Logout") }
  element(:browser_override) { |b| b.link(id: 'overridelink') } # security certificate error  link __  Continue to this website (not recommended).


  def login_SSO(excel_folder_Name, sheet_Name, row, column)

    if browser_override.exists?
      browser_override.when_present.click
    end

    if @browser.input(class: 'button', text: 'No').exists?
      @browser.input(class: 'button').click
    end
    if logoutBtn.exists?
      logoutBtn.when_present.click
    end
    # userName.when_present.set excel("UsdaTestData.xlsx", "Login_info", 1, 0) #worksheet[1][0].value  ************   VVI ****************
    # password.when_present.set excel("UsdaTestData.xlsx", "Login_info", 1, 1) #worksheet[1][1].value  ************   VVI ****************
    sync_obj(userName, "SSO username input field not displayed as expected")
    userName.when_present.set excel(excel_folder_Name, sheet_Name, row, column) #worksheet[1][0].value  ************   VVI ****************
    password.when_present.set excel(excel_folder_Name, sheet_Name, row, column+1) #worksheet[1][1].value  ************   VVI ****************
    #     *******************************
    # $rand_data = [*10..48].sample
    # p  "iteuser#{$rand_data}"
    # userName.when_present.set "iteuser#{$rand_data}"
    # password.when_present.set "itetest"
    #     *******************************

    if submit_Button_error.exists?
      submit_Button_error.when_present.click
    else
      submit_Button.when_present.click
    end

    sleep 3
    # @browser.title.include? 'https://sso.preprod.uscis.dhs.gov/sso/dashboard'

    sync_obj(logoutBtn, 'Logout Button not displayed and login not successful')
    if logoutBtn.exists?
      puts '*****  Login Successful *****'
    end
    #    @browser.send_keys [:control,'t']
    # # browser = Watir::Browser.new :ie
    # browser.windows.last.use

  end

  def login_SSO_Manager(excel_folder_Name, sheet_Name, row, column)
    if browser_override.exists?
      browser_override.when_present.click
    end

    if @browser.input(class: 'button', text: 'No').exists?
      @browser.input(class: 'button').click
    end

    objRefresh(userName)
    if logoutBtn.exists?
      logoutBtn.when_present.click
    end
    # rand_data_manager = $rand_data+1
    # userName.when_present.set "iteuser#{rand_data_manager}"
    # password.when_present.set "itetest"

    # userName.when_present.set excel("UsdaTestData.xlsx", "Login_info_Manager", 1, 0)
    # password.when_present.set excel("UsdaTestData.xlsx", "Login_info_Manager", 1, 1)
    sync_obj(userName, "SSO username input field not displayed as expected")
    userName.when_present.set excel(excel_folder_Name, sheet_Name, row, column) #worksheet[1][0].value  ************   VVI ****************
    password.when_present.set excel(excel_folder_Name, sheet_Name, row, column+1) #worksheet[1][1].value  ************   VVI ****************

    if submit_Button_error.exists?
      submit_Button_error.when_present.click
    else
      submit_Button.when_present.click
    end
    sleep 3
    if @browser.title.include? 'https://sso.preprod.uscis.dhs.gov/sso/dashboard'
      puts '*****  Login Successful as Manager *****'
    else
      puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    Login <<< NOT >>> Successful as Manager     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    end


  end


  def login_SSO_Secoandary_Approver
    if @browser.input(class: 'button').exists? # click on pop up no if display
      @browser.input(class: 'button').click
    end

    userName.when_present.set excel("UsdaTestData.xlsx", "Login_Secoandary_Approver", 1, 0)
    password.when_present.set excel("UsdaTestData.xlsx", "Login_Secoandary_Approver", 1, 1)

    if submit_Button_error.exists?
      submit_Button_error.when_present.click
    else
      submit_Button.when_present.click
    end
    sleep 3
    @browser.title.include? 'https://sso.preprod.uscis.dhs.gov/sso/dashboard'
    puts '*****  Login Successful as Manager *****'

  end


  def logout_SSO
    @browser.send_keys [:control, :tab]
    logoutBtn.when_present.click
    puts '**** Logout  Successful  *****'
  end


end