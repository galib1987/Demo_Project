class UsdaTest <GenericBasePage
  include CF
  page_url "https://newfarmers.usda.gov/discovery"
  sleep 3
  element(:get_to) { |b| b.a(:text => 'Get Started') }
  element(:where_do_you_farm) { |b| b.input(:xpath => "//*[@id='edit_field_discovery_location_tid_chosen']/ul/li/input") }
  element(:who_are_you) { |b| b.input(:xpath => "//*[@id='edit_field_discovery_audience_tid_chosen']/ul/li/input") }
  element(:what_are_you_farming) { |b| b.input(:xpath => "//*[@id='edit_field_discovery_product_tid_chosen']/ul/li/input") }
  element(:what_is_your_model) { |b| b.input(:xpath => "//*[@id='edit_field_discovery_practice_tid_chosen']/ul/li/input") }
  element(:what_do_you_need) { |b| b.input(:xpath => "//*[@id='edit_field_discovery_category_tid_chosen']/ul/li/input") }
  element(:next_farm) { |b| b.a(:text => 'Next') }
  element(:who_are_you_next) { |b| b.a(:xpath => "//*[@id='edit-field-discovery-audience-tid-wrapper']/span[2]/a") }
  element(:what_are_you_farming_next) { |b| b.a(:xpath => "//*[@id='edit-field-discovery-product-tid-wrapper']/span[2]/a") }
  element(:what_is_your_model_next) { |b| b.a(:xpath => "//*[@id='edit-field-discovery-practice-tid-wrapper']/span[2]/a") }
  element(:what_do_you_need_next) { |b| b.a(:xpath => "//*[@id='edit_field_discovery_category_tid_chosen']/ul/li/input") }
  element(:apply_button) { |b| b.input(:xpath => "//*[@id='edit-submit-discovery-tool']") }
  element(:name_flash) { |b| b.h3(:id => 'results-section') }
  element(:search_term) { |b| b.input(:xpath => "//*[@id='search_form']/input[3]") }
  element(:search_negative) { |b| b.div(:id => 'no-results') }


  def start_get
    # sync_obj(get_to, "get to not displayed as expected")
    get_to.when_present.click
  end

  def select_who_are_you_next
    who_are_you_next.when_present.click
  end

  def select_what_are_you_farming_next
    what_are_you_farming_next.when_present.click
  end

  def select_where_do_you_want_to_farm
    where_do_you_farm.when_present.click
  end

  def select_what_is_your_model_next
    what_is_your_model_next.when_present.click
  end

  def select_what_do_you_need_next
    what_do_you_need_next.when_present.click
  end

  def select_who_are_you
    who_are_you.when_present.click
  end

  def select_what_are_you_farming
    what_are_you_farming.when_present.click
  end

  def select_what_is_your_model
    what_is_your_model.when_present.click
  end

  def select_what_do_you_need
    what_do_you_need.when_present.click
  end

  def select_next_farm_btn
    next_farm.when_present.click
  end

  def select_apply_btn
    apply_button.when_present.click
  end

  def select_name_flash
    name_flash.when_present.flash
    #expect(@browser.text).to include('Results')
    puts name_flash.text
  end

  def select_search_term
    search_term.when_present.click
  end

  def display_search_negative
    search_negative.when_present.flash
    puts search_negative.text
  end

end
