module LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end

  class Stack
    attr_reader :data

    def initialize
      @data = nil
    end


    def push(value)
      @data = Node.new(value, @data)
    end

    def pop
      value = @data.value
      @data = @data.next_node
      puts value
    end

    def popall
      until @data.nil? do
        pop
      end
    end

    def reverse_list(list)
      #put some code here

      while list
        #something
        list = list.next_node
      end

      #more code
    end

    def getnodes(count)
      while count != 0
        puts "What's your value?"
        newnode = gets.chomp
        push(newnode)
        count = count - 1
      end
    end

  end
end

stack = LinkedList::Stack.new

puts "How many nodes do you want?"
count = gets.chomp.to_i
puts ""
puts "Ok. Let's get #{count} nodes!"

stack.getnodes(count)

stack.popall
