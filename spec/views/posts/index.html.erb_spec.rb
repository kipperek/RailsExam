require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, Kaminari.paginate_array(
    	[
	      stub_model(Post,
	        :content => "I like ruby !",
	        :description => "MahPost",
	      ),
	      stub_model(Post,
	        :content => "I like ruby !",
	        :description => "MahPost",
	      )
    	]).page(1)
    )
  end

  it "renders list of posts" do
    render
    assert_select "tr>td", :text => "I like ruby !".to_s, :count => 2
    assert_select "tr>td", :text => "MahPost".to_s, 	  :count => 2
  end
end
