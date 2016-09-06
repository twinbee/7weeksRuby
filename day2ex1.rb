# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. 

naturals = (1..16).to_a();

# Now, we're going to loop over the naturals using each. However, in
# order to output 4 naturals at a time, we're gonna only do so on
# certain indexes.
#
# Since we don't have any insight into which value we are looking
# at (index-wise), we're going to keep an internal stack of
# naturals which we will output only when it reaches a length of 4.
# However, I can't figure out how to do this with *just* each. As
# such, I am creating an external stack.

stack= [];

# Now, loop over each element in the array.

naturals.each{ |value|

    # Push the current iteration value onto the stack.

    stack.push( value );

    # Check to see if the value stack has reached a length of 4. If
    # so, we are going to output it.

    if (stack.length == 4)

        # Output the stack of 4 naturals as a list.

        puts( stack.join( ", " ) );

        # Reset the value stack to prepare it to collect the next
        # four naturals in the array.

        stack= [];

    end

};

# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. Now, do the same with each_slice in
# Enumerable.


# First, let's build up our array. We can use a Range's Enumerable
# properties to build our array of naturals.

# to_a is "to array" (from object)
naturals = (1..16).to_a();


# This time, we are going to iterate over the array, four elements
# at a time, using the each_slice() method. This allows us to look
# at sections of an array as sub-arrays.

naturals.each_slice( 4 ){ |i|

    # Output the sub-section of the array as a list.

    print ( i.to_a );
	puts
};
