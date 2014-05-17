class Gist < ActiveRecord::Base
	validates :snippet, :lang, :presence => true
	 belongs_to :user

	
def self.search(search)
    if search 
        @local = User.where('name LIKE ?', "%#{search}%")
        return where(user_id: @local)
    else
        all
    end
end

def self.find_user(search)
    if search 
        find(:all, :conditions => ['user_id = ?', "#{search}"])
    else
        all
    end
end


end
