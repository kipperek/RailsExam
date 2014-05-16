class Gist < ActiveRecord::Base
	 belongs_to :user
def self.search(search)
    if search 
        find(:all, :conditions => ['description OR snippet OR user_id LIKE ?', "%#{search}%"])
    else
        all
    end
end
end
