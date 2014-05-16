class Post < ActiveRecord::Base
	 belongs_to :user

	validates :content, :description, :presence => true


def timestamp
  created_at.strftime('%d %B %Y %H:%M:%S')
end

def self.search(search)
    if search 
        find(:all, :conditions => ['content LIKE ?',"%#{search}%"])
    else
	all
    end
end
end
