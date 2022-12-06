require 'rails_helper'

RSpec.describe SearchController, type: :controller do
    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status("200") # success
        end
    end

    describe 'GET #search' do
        it 'returns http success' do
            get :search
            expect(response).to have_http_status("302") # redirect to root
        end
    end

    describe '#search' do
        it 'should return results' do
          get :search, params: { wrong: 'test' }
          expect(response).to redirect_to root_path
        end
    end


end
