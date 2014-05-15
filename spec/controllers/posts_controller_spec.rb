require 'spec_helper'


describe PostsController do

 
  let(:valid_attributes) { { "content" => "MyText", "description" => "Some description" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end

   describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

    describe "GET new" do
    it "not assigning a new post as @post when not logged" do
      session[:user_id] = nil
      get :new, {}, valid_session
      expect(assigns(:post)).to be_nil
    end

     it "not assigning a new post as @post when logged as notAdmin" do
      User.create
      session[:user_id] = 1
      get :new, {}, valid_session
      expect(assigns(:post)).to be_nil
    end

    it "assigning a new post as @post when logged as admin" do
      User.create({:is_admin => true })
      session[:user_id] = 1
      get :new, {}, valid_session
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

    describe "GET edit" do
      it "not assigns the requested post as @post if not logged" do
         session[:user_id] = nil
        post = Post.create! valid_attributes
        get :edit, {:id => post.to_param}, valid_session
        expect(assigns(:post)).to be_nil
      end

       it "not assigns the requested post as @post if logged as non admin" do
        User.create
        session[:user_id] = 1
        post = Post.create! valid_attributes
        get :edit, {:id => post.to_param}, valid_session
        expect(assigns(:post)).to be_nil
      end

        it "assigns the requested post as @post if logged as admin" do
        User.create({:is_admin => true })
        session[:user_id] = 1
        post = Post.create! valid_attributes
        get :edit, {:id => post.to_param}, valid_session
        expect(assigns(:post)).to eq(post)
      end
    end

    describe "POST create" do
      describe "not logged" do
          it "dont creates a new Post" do
            session[:user_id] = nil
            expect {
              post :create, {:post => valid_attributes}, valid_session
            }.to change(Post, :count).by(0)
          end

          it "not assigns a newly created post as @post" do
            session[:user_id] = nil
            post :create, {:post => valid_attributes}, valid_session
            expect(assigns(:post)).to be_nil
          end
      end
      describe "logged as non-admin" do
          it "dont creates a new Post" do
            User.create
            session[:user_id] = 1
            expect {
              post :create, {:post => valid_attributes}, valid_session
            }.to change(Post, :count).by(0)
          end

          it "not assigns a newly created post as @post" do
            User.create
            session[:user_id] = 1
            post :create, {:post => valid_attributes}, valid_session
            expect(assigns(:post)).to be_nil
          end
      end
        describe "logged as admin" do
          it "dont creates a new Post" do
            User.create({:is_admin => true })
            session[:user_id] = 1
            expect {
              post :create, {:post => valid_attributes}, valid_session
            }.to change(Post, :count).by(1)
          end

          it "not assigns a newly created post as @post" do
            User.create({:is_admin => true })
            session[:user_id] = 1
            post :create, {:post => valid_attributes}, valid_session
            expect(assigns(:post)).to be_a(Post)
          end
      end
    end

   describe "DELETE destroy" do
    describe "not logged in" do
      it "not destroys the requested post" do
        session[:user_id] = nil
        post = Post.create! valid_attributes
        expect {
          delete :destroy, {:id => post.to_param}, valid_session
        }.to change(Post, :count).by(0)
      end
    end
    describe "logged in as non admin" do
      it "not destroys the requested post" do
        User.create
        session[:user_id] = 1
        post = Post.create! valid_attributes
        expect {
          delete :destroy, {:id => post.to_param}, valid_session
        }.to change(Post, :count).by(0)
      end
    end

    describe "logged in as admin" do
      it "destroys the requested post" do
        User.create({:is_admin => true })
        session[:user_id] = 1
        post = Post.create! valid_attributes
        expect {
          delete :destroy, {:id => post.to_param}, valid_session
        }.to change(Post, :count).by(-1)
      end
    end
  end


end
