require_relative "list.rb"
require_relative "item.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "Type in a command: "
        cmd, *args = gets.chomp.split(" ")

        case cmd
        when "mktodo"
            @list.add_item(*args)
            return true

        when "up"
            args.map! {|ele| ele.to_i}
            @list.up(*args)
            return true

        when "down"
            args.map! {|ele| ele.to_i}
            @list.down(*args)
            return true
            
        when "swap"
            args.map! {|ele| ele.to_i}
            @list.swap(*args)
            return true

        when "sort"
            @list.sort_by_date!
            return true

        when "priority"
            @list.print_priority
            return true

        when "prints"
            if args.empty?
                @list.prints
                return true
            else
                @list.print_full_item(*args)
                return true
            end
        when "quit"
            return false
        else
            puts "Sorry, that command is not recognized."
        end
        true
    end

    def run
        while get_command
            self.get_command
        end
    end

end