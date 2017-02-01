require "rails_helper"

RSpec.feature "Users can view products" do
  scenario "without authenticate" do
    visit "/"
    expect(page).to have_content "Hecho en México"
  end
end