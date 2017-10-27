Given(/^user visit USDA site$/) do
  visit UsdaTest

end

When(/^user clicks on get started on discovery tool$/) do
  sleep 6
  on(UsdaTest).start_get
end

And(/^User choose option (.*) from dropdown list$/) do |where_do_you_want_to_farm|
  on(UsdaTest).select_where_do_you_want_to_farm
  @browser.input(:xpath => "//*[@id='edit_field_discovery_location_tid_chosen']/ul/li/input").when_present.send_keys where_do_you_want_to_farm
  @browser.input(:xpath => "//*[@id='edit_field_discovery_location_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_next_farm_btn
end


And(/^User choose option1 (.*) from dropdown list$/) do |who_are_you|
  on(UsdaTest).who_are_you
  @browser.input(:xpath => "//*[@id='edit_field_discovery_audience_tid_chosen']/ul/li/input").when_present.send_keys who_are_you
  @browser.input(:xpath => "//*[@id='edit_field_discovery_audience_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_who_are_you_next
end

And(/^User choose option2 (.*) from dropdown list$/) do |what_are_you_farming|
  on(UsdaTest).select_what_are_you_farming
  @browser.input(:xpath => "//*[@id='edit_field_discovery_product_tid_chosen']/ul/li/input").when_present.send_keys what_are_you_farming
  @browser.input(:xpath => "//*[@id='edit_field_discovery_product_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_what_are_you_farming_next
end

And(/^User choose option3 (.*) from dropdown list$/) do |what_is_your_model|
  on(UsdaTest).select_what_is_your_model
  @browser.input(:xpath => "//*[@id='edit_field_discovery_practice_tid_chosen']/ul/li/input").when_present.send_keys what_is_your_model
  @browser.input(:xpath => "//*[@id='edit_field_discovery_practice_tid_chosen']/ul/li/input").when_present.send_keys :enter
  sleep 2
  on(UsdaTest).select_what_is_your_model_next
end

And(/^User choose option4 (.*)from dropdown list$/) do |what_do_you_need|
  on(UsdaTest).select_what_do_you_need
  @browser.input(:xpath => "//*[@id='edit_field_discovery_category_tid_chosen']/ul/li/input").when_present.send_keys what_do_you_need
  @browser.input(:xpath => "//*[@id='edit_field_discovery_category_tid_chosen']/ul/li/input").when_present.send_keys :enter
  #on(UsdaTest).select_what_do_you_need_next
end

And(/^User click on Apply button to search information$/) do
  on(UsdaTest).select_apply_btn
end

Then(/^user gets results based on the choices made$/) do
  sleep 2
  on(UsdaTest).select_name_flash
  sleep 2
end