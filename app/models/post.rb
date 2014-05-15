class Post < ActiveRecord::Base
	 belongs_to :user
def self.search(search)
    if search 
        find(:all, :conditions => ['content  LIKE ?',"%#{search}%"])
    else
	all
    end
end
end