require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe "GET #home" do
    context "when not logged in" do
      it "redirects to the sign in page" do
        get :home

        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context "when logged in" do
      before(:each) do
        login_user
      end

      it "renders the pages#home page" do
        get :home

        expect(response.body).
        to have_text("Home")
      end
    end
  end
end
