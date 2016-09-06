# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child
# 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }

## reference impl starts here

class Tree
 attr_accessor :children, :node_name
 def initialize(name, children=[])
  @children = children
  @node_name = name
 end

 def visit_all(&block)
  visit &block
  children.each {|c| c.visit_all &block}
end
 def visit(&block)
  block.call self
 end
end # class Tree

puts "::: Example part :::"

ruby_tree = Tree.new( "Ruby", [Tree.new("Reia"), Tree.new("MacRuby")] )
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

## custom impl starts here

class MbTree
 attr_accessor :children, :node_name
 
 def initialize( treeData )
        @node_name = "root";
        @children = [];
		
		        if (treeData.size() == 1)

            # We only have one top-level key. We can use that to
            # define this MbTree node.
			# e.g. grandpa
            @node_name = treeData.keys()[ 0 ];

            # Convert the sub-level MbTree data into the chile nodes
            # of this MbTree node.

            treeData[ @node_name ].each{ |key, value|

                @children.push(
                    MbTree.new( { key => value } )
                );

            };

        else

            # We have more than one top-level key. We need to
            # create a root node to house multiple nodes.

            MbTreeData.each{ |key, value|

                @children.push(
                    MbTree.new( { key => value } )
                );

            };

        end

    end
 
    # I visit all decendant nodes in a depth-first traversal.

    def visitAll( &block )

        # Visit this node.

        visit( &block );

        # Visit all of this node's children.

        children.each{ |c|

            c.visitAll( &block );

        }

    end


    # I visit just this node.

    def visit( &block )

        block.call( self );

    end
end # class MbTree

puts "::: Exercise part :::"

mb_tree = MbTree.new( {"grandpa" => { "dad" => {"child1" => {}, "child2" => {} },  "uncle" => {"child3" => {}, "child4" => {} } } })

mb_tree.visitAll{ |node|
    puts( "Visiting #{node.node_name}" );
};