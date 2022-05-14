require 'rails_helper'

RSpec.describe 'All Posts', type: :request do
  describe 'GET posts#index' do
    before :each do
      get '/users/4/posts'
    end

    it 'checks if the correct status was returned' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if correct template was rendered' do
      expect(response).to render_template('index')
    end
  end
end

RSpec.describe 'Singe Post', type: :request do
  describe 'GET posts#show' do
    before :each do
      get '/users/4/posts/4'
    end

    it 'checks if response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if correct template was rendered' do
      expect(response).to render_template('show')
    end
  end
end
