class Item
    attr_reader :done

    def self.valid_date?(date_string)
        nums = date_string.split("-")
        y = nums[0]
        m = nums[1].to_i
        d = nums[2].to_i

        return false if y.length != 4
        return false if m < 1 || m > 12
        return false if d < 1 || d > 31
        true

    end

    def initialize(title, deadline, description)
        raise "incorrect date" if !(Item.valid_date?(deadline))
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "deadline is not valid"
        end
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end

    def toggle
        if @done == true
            @done = false
        else
            @done = true
        end
    end

end