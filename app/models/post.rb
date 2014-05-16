class Post < ActiveRecord::Base
	 belongs_to :user

def timestamp
  created_at.strftime('%d %B %Y %H:%M:%S')
end

def self.search(search)
    if search 
        find(:all, :conditions => ['content OR user_id  LIKE ?',"%#{search}%"])
    else
	all
    end
end
end
