class Gist < ActiveRecord::Base
	validates :snippet, :lang, :presence => true
	 belongs_to :user

	
def self.search(search)
    if search 
        @f = find(:all, :conditions => ['description  LIKE ?', '%#{search}%'])
@s = find(:all, :conditions => ['content  LIKE ?', '%#{search}%'])
return @s + @f

    else
        all
    end
end

def self.find_user(search)
    if search 
        find(:all, :conditions => ['user_id =?', "#{search}"])
    else
        all
    end
end


end
