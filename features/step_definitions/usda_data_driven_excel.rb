
And(/^User choose option "([^"]*)" from the list select$/) do |row|
  r = row.to_i
  on(UsdaTest).select_where_do_you_want_to_farm
  @browser.input(:xpath => "//*[@id='edit_field_discovery_location_tid_chosen']/ul/li/input").when_present.send_keys excel("UsdaTestData.xlsx", "Test_Data",r,0)

  @browser.input(:xpath => "//*[@id='edit_field_discovery_location_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_next_farm_btn
end

And(/^User choose option1 "([^"]*)" from the list select$/) do |who_are_you|
  r = who_are_you.to_i
  on(UsdaTest).who_are_you
  @browser.input(:xpath => "//*[@id='edit_field_discovery_audience_tid_chosen']/ul/li/input").when_present.send_keys excel("UsdaTestData.xlsx", "Test_Data",r,1)
  @browser.input(:xpath => "//*[@id='edit_field_discovery_audience_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_who_are_you_next
end

And(/^User choose option2 "([^"]*)" from the list select$/) do |what_are_you_farming|
  r = what_are_you_farming.to_i
  on(UsdaTest).select_what_are_you_farming
  @browser.input(:xpath => "//*[@id='edit_field_discovery_product_tid_chosen']/ul/li/input").when_present.send_keys excel("UsdaTestData.xlsx", "Test_Data",r,2)
  @browser.input(:xpath => "//*[@id='edit_field_discovery_product_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_what_are_you_farming_next
end

And(/^User choose option3 "([^"]*)" from the list select$/) do |what_is_your_model|
  r = what_is_your_model.to_i
  on(UsdaTest).select_what_is_your_model
  @browser.input(:xpath => "//*[@id='edit_field_discovery_practice_tid_chosen']/ul/li/input").when_present.send_keys excel("UsdaTestData.xlsx", "Test_Data",r,3)
  @browser.input(:xpath => "//*[@id='edit_field_discovery_practice_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_what_is_your_model_next
end

And(/^User choose option4 "([^"]*)" from the list select$/) do |what_do_you_need|
  r = what_do_you_need.to_i
  on(UsdaTest).select_what_do_you_need
  @browser.input(:xpath => "//*[@id='edit_field_discovery_category_tid_chosen']/ul/li/input").when_present.send_keys excel("UsdaTestData.xlsx", "Test_Data",r,4)
  @browser.input(:xpath => "//*[@id='edit_field_discovery_category_tid_chosen']/ul/li/input").when_present.send_keys :enter
  #on(UsdaTest).select_what_do_you_need_next
end


