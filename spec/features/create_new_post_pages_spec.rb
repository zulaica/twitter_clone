require "rails_helper"

describe "the create new posts process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"
  end

  it "creates a post" do
    visit new_post_path
    fill_in "Body", :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec purus in ante pretium blandit. Aliquam erat volutpat. Nulla libero lectus."
    click_on "Create Post"
    expect(page).to have_content "created"
  end

  it "throws an error if the form isn't filled out" do
    visit new_post_path
    click_on "Create Post"
    expect(page).to have_content "errors"
  end
end
