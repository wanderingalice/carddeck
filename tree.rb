class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def dfs(value, depth=0)
    puts "level #{depth}"
    if payload == value then
      return self
    else
      children.each { |x|
        result = x.dfs(value, depth +1)
        return result if result != nil 
      }
    end
    return nil
  end

  def bfs(value)
    queue = [self]
    visited = []

    def enqueue(item)
      queue.push(item)
    end

    def dequeue
      queue.shift
    end

    while !queue.empty?
      checkme = dequeue
      if checkme.payload == value
        return "Found #{checkme.payload}"
      end
      unless checkme.children.empty?
        checkme.children.each {|x|
          unless visited.include?(x)
            visited << x
            enqueue(x)
          end
        }
      end
    end
    return "Not Found"
  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

dfsresult = trunk.dfs(11)
puts dfsresult.payload

bfsresult = trunk.bfs(11)
puts bfsresult