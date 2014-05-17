require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :content => "Projekt z ruby hue hue",
      :description => "Post 999",
      :date => "17 May 2014 13:40:54",
      :user_id => "1"
    ))
  end

  it "renders edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_description[name=?]", "post[description]"
    end
  end
end
