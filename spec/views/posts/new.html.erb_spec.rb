require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :content => "Projekt z ruby hue hue",
      :description => "Post 999",
      :date => "17 May 2014 13:40:54",
      :user_id => "1"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_description[name=?]", "post[description]"
    end
  end
end
