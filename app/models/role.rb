class Role < ActiveRecord::Base
     has_many :auditions

     def actors
        self.auditions.map do |auditions|
            auditions.actor
        end

    end

    def locations
        self.auditions.map do |auditions|
            auditions.location
        end
    end

    def lead 
        return self.auditions.first if self.auditions.count > 0
        "no actor has been hired for this role"
    end

    def understudy
        return self.auditions.second if self.auditions.count > 0
        "no actor has been hired for this understudy role"
    end

  
end