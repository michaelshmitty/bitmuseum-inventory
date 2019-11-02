require "rails_helper"

RSpec.feature "User authentication" do
  let!(:user) { create(:confirmed_user, email: "user@example.com", password: "verysecret") }

  scenario "User signs in with invalid credentials" do
    visit new_user_session_path
    fill_in "user_email", with: "admin@example.com"
    fill_in "user_password", with: "wrongpassword"
    click_button "Sign in"

    expect(page).to have_text("Invalid Email or password.")
  end

  scenario "User signs in with valid credentials" do
    sign_in_with user.email, "verysecret"

    expect(page).to have_text("Home")
  end

  scenario "User signs out" do
    sign_in_with user.email, "verysecret"
    click_link "Sign out"

    expect(page).to have_text("Sign in")
  end

  scenario "User updates first name in settings" do
    sign_in_with user.email, "verysecret"
    visit edit_user_registration_path

    expect(page).to have_text("Edit User")

    fill_in "user_first_name", with: "Jane"
    fill_in "user_last_name", with: "Doe"
    fill_in "user_current_password", with: "verysecret"
    click_button "Update"

    expect(page).to have_text("Your account has been updated successfully.")
    expect(user.reload.first_name).to eq("Jane")
  end

  scenario "User resets password" do
    visit new_user_password_path
    fill_in "user_email", with: "user@example.com"
    click_button "Send instructions"
    expect(unread_emails_for(user.email)).to be_present

    open_email user.email, with_subject: "Reset password instructions"
    visit_in_email "Change my password"
    expect(page).to have_text("Change your password")

    fill_in "user_password", with: "new_secret"
    fill_in "user_password_confirmation", with: "new_secret"
    click_button "Change my password"
    expect(page).to have_text("Your password has been changed successfully. You are now signed in.")
  end
end
