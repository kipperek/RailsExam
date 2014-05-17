require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, Kaminari.paginate_array(
    	[
	      stub_model(Post,
	        :content => "I like ruby !",
	        :description => "MahPost",
                :timestamp => "17 May 2014 13:40:54",
	      ),
	      stub_model(Post,
	        :content => "I like ruby !",
	        :description => "MahPost",
                :timestamp => "17 May 2014 13:40:54",
	      )
    	]).page(1)
    )
  end

  it "renders list of posts" do

    render
    assert_select "div>div>div>p", :text => "I like ruby !".to_s, :count => 2
    assert_select "div>div>div>h3", :text => "MahPost".to_s, 	  :count => 2
  end
end

describe "posts/index" do
  before(:each) do
    assign(:posts, Kaminari.paginate_array(
      [
        stub_model(Post,
          :content => "I like ruby !",
          :description => "MahPost",
                :timestamp => "17 May 2014 13:40:54",
                :user_id => "1"
        ),
        stub_model(Post,
          :content => "I like ruby !",
          :description => "MahPost",
                :timestamp => "17 May 2014 13:40:54",
                :user_id => "1"
        )
      ]).page(1)
    )
  end

  it "check if admin see add post button" do
    @usr = User.create({:is_admin => true})
    session[:user_id] = @usr.id
    render
    assert_select "a", :text => "New Post".to_s, :count => 1

  end
end

