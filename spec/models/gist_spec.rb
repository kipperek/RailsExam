require 'spec_helper'



describe Gist do
	it "create gist" do
      gist = Gist.create
	end

	it "has a valid factory" do
	FactoryGirl.create(:gist).should be_valid	
	end

	it "is invalid without a snippet" do
	FactoryGirl.build(:gist, snippet: nil).should_not be_valid
	end
	it "is invalid without a lang" do
	FactoryGirl.build(:gist, lang: nil).should_not be_valid
	end
end
