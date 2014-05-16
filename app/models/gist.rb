class Gist < ActiveRecord::Base
	validates :snippet, :lang, :presence => true
	 belongs_to :user

	
def self.search(search)
    if search 
        find(:all, :conditions => ['description OR snippet LIKE ?', "%#{search}%"])
    else
        all
    end
end
end
