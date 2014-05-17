require 'spec_helper'


describe GistsController do
	let(:valid_attributes) { { "lang" => "java", "description" => "some desc", "snippet" => "Some text", "user_id" => 1 } }
	let(:invalid_attributes) { { "lang" => "asdasdasdas", "description" => "some desc", "snippet" => "Some text" } }
	let(:valid_session) { {} }

	describe "GET index" do
	    it "gets index and assign all gists into @gists" do
	      gist = Gist.create! valid_attributes
	      get :index, {}, valid_session
	      expect(assigns(:gists)).to eq([gist])
	    end
	end

	describe "GET new" do
	    it "assigns blank gist as @gist if logged" do
	    	User.create
			session[:user_id] = 1
	      get :new, {}, valid_session
	      expect(assigns(:gist)).to be_a_new(Gist)
	    end

	     it "not assigning new gist if not logged" do
	    	
		  session[:user_id] = nil
	      get :new, {}, valid_session
	      expect(assigns(:gist)).to be_nil
	    end
	end

	describe "GET show" do
	    it "assigns the requested gist as @gist" do
	      gist = Gist.create! valid_attributes
	      get :show, {:id => gist.to_param}, valid_session
	      expect(assigns(:gist)).to eq(gist)
	    end
	 end

	describe "GET edit" do
	    it "assigns the requested gist as @gist" do
	      gist = Gist.create! valid_attributes
	      get :edit, {:id => gist.to_param}, valid_session
	      expect(assigns(:gist)).to eq(gist)
	    end
	  end

	describe "#Create new gist" do
		it "creates a new Gist" do
			User.create
			session[:user_id] = 1

	        expect {
	          post :create, {:gist => valid_attributes}, valid_session
	        }.to change(Gist, :count).by(1)
     	end
	
		it "gists with valid attr have valid lang" do
     		User.create
			session[:user_id] = 1

			post :create, {:gist => valid_attributes}, valid_session

			expect(assigns[:gist].lang).to eq(valid_attributes["lang"])
     	end

     	it "gists with invalid attr have lang: text" do
     		User.create
			session[:user_id] = 1

			post :create, {:gist => invalid_attributes}, valid_session

			expect(assigns[:gist].lang).to eq("text")
     	end
	end

	describe "destroy" do
		it "destroys the requested gist if logged" do
		  User.create
		  session[:user_id] = 1
	      gist = Gist.create! valid_attributes
	      expect {
	        delete :destroy, {:id => gist.to_param}, valid_session
	      }.to change(Gist, :count).by(-1)
    	end

    	it "not destroys the requested gist if NOT logged" do
		  
		  session[:user_id] = nil

	      gist = Gist.create! valid_attributes
	      expect {
	        delete :destroy, {:id => gist.to_param}, valid_session
	      }.to change(Gist, :count).by(0)
    	end
	end

end
