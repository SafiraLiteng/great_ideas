require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  let :idea {FactoryGirl.create(:idea)}
  let :user {FactoryGirl.create(:user)}
  #let :user2 {FactoryGirl.create(:user)}

  def valid_post
    post :create, params: { idea: FactoryGirl.attributes_for(:idea) }
  end

  def invalid_post

    post :create, params: {idea: FactoryGirl.attributes_for(:idea, title: nil)}

  end


  describe '#new' do

    context 'with a signed in user' do
      before { signed_in_as_a_valid_user }

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end

      it 'assigns a idea instance variable to a new idea' do
				get :new
        expect(assigns(:idea)).to be_a_new(Idea)
      end
    end
  end

  describe '#create' do
    context 'with a signed in user' do
      before { signed_in_as_a_valid_user }

      context 'with valid attributes' do
        it 'creates a new idea in the database' do
          count_before = Idea.count
          valid_post
          count_after = Idea.count

          expect(count_after).to eq(count_before + 1)
        end

        it 'redirect to the idea show page' do
          valid_post
          expect(response).to redirect_to(idea_path(Idea.last))
        end

      end

      context 'with invalid attributes' do
        it 'doesnt\'t create an idea with empty title' do
        count_before = Idea.count
        invalid_post
        count_after = Idea.count
        expect(count_after).to eq(count_before)
      end
      it "does not create a record in the db" do
          expect {invalid_post}.to change {Idea.count}.by(0)
        end

    end
  end
end


end
