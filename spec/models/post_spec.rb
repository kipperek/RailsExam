require 'spec_helper'

describe Post do
	it "create post" do
          post = Post.create
	end
	it "has a valid factory" do
	FactoryGirl.create(:post).should be_valid
       end
	it "is invalid without content" do
	FactoryGirl.build(:post, content:nil).should_not be_valid
	end
	it "is invalid without description" do
	FactoryGirl.build(:post,description:nil).should_not be_valid
	end
	
end
