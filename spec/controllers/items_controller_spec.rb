require 'rails_helper'

describe ItemsController do
  
  describe 'GET #new' do
    it "redirect to new.html.haml?" do
      get :new
      expect(response).to render_template :new
    end
  end
end