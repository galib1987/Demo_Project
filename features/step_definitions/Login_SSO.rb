Given(/^User navigate to ICAM SSO login page and logs in with valid credentials$/) do
  visit Login_Page
  if on(Login_Page).userName.exists?
  else
    if on(Login_Page).logoutBtn.exists?
      on(Login_Page).logoutBtn.when_present.click
    end
    @browser.refresh
    visit Login_Page
  end
  on(Login_Page).login_SSO("UsdaTestData.xlsx", "Login_info", 1, 0)

  # puts "            User   :  #{excel("UsdaTestData.xlsx", "Login_info", 1, 0)}"
  # puts "          Password :  #{excel("UsdaTestData.xlsx", "Login_info", 1, 1)}"

end

Given(/^User navigate to ICAM SSO login page and logs in with valid credentials\*$/) do
  visit Login_Page
  on(Login_Page).login_SSO("UsdaTestData.xlsx", "Login_info", 2, 0)

  puts "            User   :  #{excel("UsdaTestData.xlsx", "Login_info", 2, 0)}"
  puts "          Password :  #{excel("UsdaTestData.xlsx", "Login_info", 2, 1)}"
end

And(/^User should be able to logout from ICAM system$/) do
  visit Login_Page
  on(Login_Page).login_SSO("UsdaTestData.xlsx", "Login_info", 1, 0)
  on(Login_Page).logout_SSO
end


# Given(/^(.*) (.*) navigate to ICAM SSO login page and logs in with valid credentials$/) do |user, pass|
#   visit Login_Page
#   on(Login_Page).userName.when_present.set user #excel("UsdaTestData.xlsx", "Login_info",1,0)
#   on(Login_Page).password.when_present.set pass #excel("UsdaTestData.xlsx", "Login_info",1,1)
#   if on(Login_Page).submit_Button_error.exists?
#     on(Login_Page).submit_Button_error.when_present.click
#   else
#     on(Login_Page).submit_Button.when_present.click
#   end
#   logoutbtn = on(Login_Page).logoutBtn
#   sync_obj(logoutbtn, "  #######    LOGIN   NOT SUCCESSFUL      #########")
# end



And(/^User should be able to logout from ICAM system and myAccess system$/) do
  on(Create_New_Request).logout_myAccess
end

And(/^User sign out from my\-access system and user navigate to ICAM Enterprise SSO Login page$/) do
  on(Create_New_Request).logout_myAccess
end

Given(/^"([^"]*)" and  navigate to ICAM SSO login page and logs in with valid credentials$/) do |row|
  r = row.to_i
  visit Login_Page
  sleep 3
  on(Login_Page).userName.when_present.set excel("UsdaTestData.xlsx", "Login_info",r,0)
end
