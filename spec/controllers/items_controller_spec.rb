require 'rails_helper'

describe ItemsController do

  describe 'GET #index' do
    it "@items true data includes?" do
      items = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(items)
    end
  end
  
  describe 'GET #new' do
    it "redirect to new.html.haml?" do
      get :new
      expect(response).to render_template :new
    end
  end

  # describe 'GET #edit' do
  #   it "@item true data include?" do
  #     item = create(:item)
  #     get :edit, params: { id: item }
  #     expect(assigns(:item)).to eq item
  #   end

  #   it "redirect to edit.html.haml?" do
  #     item = create(:item)
  #     get :edit, params: { id: item }
  #     expect(response).to render_template :edit
  #   end
  # end

end