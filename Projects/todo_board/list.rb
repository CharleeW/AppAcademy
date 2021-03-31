require_relative "item.rb"

class List

    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            new_item = Item.new(title, deadline, description)
            @items << new_item
        else
            return false
        end
        true
    end

    def size
        @items.length
    end

    def valid_index?(indexx)
        return false if (indexx.to_i > size) || (indexx.to_i < 0)
        true
    end

    def swap(index_1, index_2)
        if (valid_index?(index_1)) && (valid_index?(index_2))
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        else
            return false
        end
        true
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            return nil
        end

    end

    def priority
        @items[0]
    end

    def prints
        p "-------------------------"
        p @label
        p "-------------------------"
        p "Index" + " | " + "Item" + " | " + "Dealine"
        p "-------------------------"
        @items.each.with_index do |ele, i|
            p i.to_s + " | " +  ele.title.to_s + " | " +  ele.deadline.to_s
        end
        p "-------------------------"
        nil
    end

    def print_full_item(index)
        current = @items[index.to_i]
        p "-------------------------"
        p current.title.to_s + " " + current.deadline.to_s
        p current.description
        p "-------------------------"
        nil
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if !(valid_index?(index))
        
        amount.times do
            if index > 0
                @items[index], @items[index - 1] = @items[index - 1], @items[index]
                index -= 1
            end
        end
        true
    end

    def down(index, amount=1)
        return false if !(valid_index?(index))
        if index < @items.length - 1
            amount.times do
                @items[index], @items[index + 1] = @items[index + 1], @items[index]
                index += 1
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|ele| ele.deadline}
    end

end