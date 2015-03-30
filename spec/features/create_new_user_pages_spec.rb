require "rails_helper"

describe "the create new user process" do
  it "creates a new user" do
    visit new_user_registration_path
    fill_in "Username", :with => "username"
    fill_in "Email", :with => "user@domain.tld"
    fill_in "Password", :with => "password123"
    fill_in "Password confirmation", :with => "password123"
    click_on "Sign up"
    expect(page).to have_content "successfully"
  end
end
