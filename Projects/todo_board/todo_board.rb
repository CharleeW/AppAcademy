require_relative "list.rb"
require_relative "item.rb"

class TodoBoard

    def initialize
        @lists = {}
    end

    def get_command
        print "Type in a command: "
        cmd, target, *args = gets.chomp.split(" ")

        case cmd
        when "mktodo"
            @lists[target].add_item(*args)
            return true

        when 'mklist'
            @lists[target] = List.new(target)

        when 'ls'
            @lists.keys.each { |label| puts ' ' + label }

        when 'showall'
            @lists.each_value(&:prints)

        when "up"
            args.map! {|ele| ele.to_i}
            @lists[target].up(*args)
            return true

        when "down"
            args.map! {|ele| ele.to_i}
           @lists[target].down(*args)
            return true
            
        when "swap"
            args.map! {|ele| ele.to_i}
            @lists[target].swap(*args)
            return true

        when "sort"
            @lists[target].sort_by_date!
            return true

        when "priority"
            @lists[target].print_priority
            return true

        when "prints"
            if args.empty?
                @lists[target].prints
                return true
            else
                @lists[target].print_full_item(*args)
                return true
            end

        when "toggle"
            @lists[target].toggle_item(*args)

        when "rm"
            @lists[target].remove_item(*args)

        when "purge"
            @lists[target].purge

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

# TodoBoard.new.run