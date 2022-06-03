require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url # "/"
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end
  test "lets a signed in user create a new product" do
    #login
    login_as users(:george)
    #visit the page
    visit "/products/new"
     # save_and_open_screenshot
    #fill in the form
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life"
     # save_and_open_screenshot
    #click on submit
    click_on "Create Product"
     # save_and_open_screenshot
    #redirect to home with a new product
    #making sure we are in the right page
    assert_equal root_path, page.current_path
    #look for our input in the form
    assert_text "Change your life"
  end
end
