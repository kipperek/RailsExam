require 'spec_helper'

describe "gists/edit" do
  before(:each) do
    @gist = assign(:gist, stub_model(Gist,
      :snippet => "int a = 3",
      :lang => "java",
      :description => "hue hue",
      :user_id => "1"
    ))
  end

  it "renders edit gist form" do
    render

    assert_select "form[action=?][method=?]", gist_path(@gist), "post" do
      assert_select "textarea#gist_snippet[name=?]", "gist[snippet]"
      assert_select "select#gist_lang[name=?]", "gist[lang]"
      assert_select "input#gist_description[name=?]", "gist[description]"
    end
  end
end
