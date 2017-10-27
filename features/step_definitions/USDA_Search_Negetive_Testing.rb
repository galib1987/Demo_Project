And(/^user clicks on search without entering any data$/) do
on(UsdaTest).select_search_term
end

Then(/^user is directed to a page and advised to enter a search term\.$/) do
on(UsdaTest).display_search_negative
end