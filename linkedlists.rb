# projects/ruby-linked-lists
class LinkedList
    require_relative 'node.rb'   
    attr_accessor :head, :tail, :size 

    def initialize
        @tail = nil
        @head = nil
        @size = 0
    end

    public

    # adds a new node to the end of the list
    def append(value)
        node = Node.new
        node.value = value

        if @head.nil?
            @head = node
            @tail = node
        else
            @tail.next_node = node
            @tail = node
        end
        @size += 1
    end

    # adds a new node to the start of the list
    def prepend(value)
        node = Node.new
        node.value = value
            
        if @head.nil?
            @head = node
            @tail = node
        else
            node.next_node = @head
            @head = node
        end
        @size += 1
    end

=begin
    # returns the total number of nodes in the list
    def size
        return @@size 
    end
        
    # returns the first node in the list
    def head
        return @head.nil? nil: @head.data
    end

    # returns the last node in the list
    def tail
        return @tail.nil ? nil: @tail.data 
    end
=end

    # returns the node at the given index
    def at(index)
        return @tail if index == -1
        return @head if index == 0

        counter = 1
        current_node = @head.next_node
        until counter == index
            current_node = current_node.next_node
            counter += 1
        end
        current_node
    end

    # removes the last element from the list
    def pop
        current_node = @head
        until current_node.next_node.nil?
            previous_node = current_node
            current_node = current_node.next_node
        end
        previous_node.next_node = nil
        @tail = previous_node
        current_node           
    end

    # returns true if the passed in value is in the list and otherwise
    # returns false
    def contains?(value)
        current_node = @head
        until current_node.nil?
            return true if current_node.value == value

            current_node = current_node.next_node
        end
        false
    end
        
    # returns the index of the node containing data, or nil if not found
    def find(value)
        current_node = @head
        counter = 0
        until current_node.nil?
            return counter if current_node.value == value

            current_node = current_node.next_node
            counter += 1
        end
        nil 
    end

    # represent LinkedList objects as strings, so you can print them out and
    # preview them in the console.
    def to_s
        results = ''
        current_node = @head
        counter = 0
        until current_node.nil?
            results += " ( #{current_node.value} ) -> "
            current_node = current_node.next_node
            counter += 1
        end
        results += 'nil'
        results
    end

    # inserts the node at the given index
    def insert_at(index, value)
        node = Node.new
        node.value = value
        counter = 0
        current_node = @head
        until counter == index
            previous_node = current_node
            current_node = current_node.next_node
            counter += 1
        end
        previous_node.next_node = node
        node.next_node = current_node
    end

    # removes the node at the given index
    def remove_at(index)
        counter = 0
        current_node = @head
        until counter == index
            previous_node = current_node
            current_node = current_node.next_node
            counter += 1
        end
        previous_node.next_node = current_node.next_node
    end
end

list = LinkedList.new
list.append('potato')
list.append('apple')
list.append('bagel')
# puts list.at(2).value
# list.pop
# puts list.tail.value
puts list.contains?('bagel')
puts list.find('bagel')
puts list.to_s
list.insert_at(1, 'cheeto')
puts list.to_s
list.remove_at(2)
puts list.to_s