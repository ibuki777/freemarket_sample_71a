require 'rails_helper'

describe SearchesController do
  describe 'GET #index' do
    it "populates an array of searches ordered by created_at DESC" do
      products = create_list(:product,2)
      get :index
      expect(assigns(:product)).to match(product)
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end