class Gist < ActiveRecord::Base
	 belongs_to :user


def self.search(search, search2)
   if search && search2
        find(:all, :conditions => ['lang=? AND description LIKE ?', "#{search}","%#{search2}%"])
     else
		find(:all)
     end
    end

end
