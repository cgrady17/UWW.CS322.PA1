(* 
 * UWW CS322 | Programming Assignment 1 | Spring 2016
 * Author: Connor P Grady (1765561)
 * Date: 1 February 2016
 * Description:
 * Implementation of a simple stack machine.
 *
 * IN-CLASS COOL HINTS:
 * 1) Local variables
 * let int1 : Int, str1 : String in {
 * 	...
 * }
 *
 * 2) if...then...else requires an else
 * 	if not (i < 0) then i <- 0 else i fi
 *)

 -- Represents an empty Stack data structure.
class Stack {
	-- Define operations on empty Stacks
	
	-- Indicates whether the Stack is Nil.
	-- Always returns true for empty Stacks.
	isNil() : Bool { true };
	
	-- Returns the element at the top of the Stack.
	-- Similar to pop(), but doesn't remove the element.
	-- Aborts on empty Stacks.
	peek() : String { {abort(); ""; } };
	
	-- Removes and returns the top element of the Stack.
	-- Similar to peek(), but removes the element as well.
	-- Aborts on empty Stacks.
	pop() : String { { abort(); ""; } };
	
	-- Adds an element to the top of the Stack.
	-- Aborts on empty Stacks.
	push(s : String) : Stack { { abort(); self; } };
	
	cons(s : String) : Stack {
		(new Cons).init(s, self)
	};
};

-- Represents a Stack data structure with at lease one element.
class Cons inherits Stack {
	-- Attributes
	
	-- The head element of this Stack instance.
	head : String;
	
	-- The tail Stack of this Stack instance.
	tail: Stack;
	
	-- Temporary object housing return value
	currentToken : String;
	
	
	-- Methods
	
	-- Indicates whether the Stack is Nil.
	isNil() : Bool { false };
	
	-- Returns the element at the top of the Stack.
	peek() : String { head };
	
	-- Removes and returns the top element of the Stack.
	-- Similar to peek(), but removes the element as well.
	pop() : String { 
		{
			currentToken <- peek(); -- Get current head element into temporary attribute
			head <- tail.pop(); -- Set head to the tail's head
			currentToken; -- Return the temporary attribute
		}
	};
	
	-- Adds an element to the top of the Stack.
	push(s : String) : Stack { 
		{
			-- self would be the tail of the new Stack
			init(s, self);
		}
	};
	
	-- Initializes a new instance of Stack with the specified
	-- head element and tail Stack.
	init(s: String, rest : Stack) : Stack {
		{
			head <- s; -- Apply the specified head element
			tail <- rest; -- Apply the specified tail Stack
			self; -- Return self
		}
	};
};

class Main inherits IO {
	input : String;
	
	myStack : Stack;

	-- Main program method that executes the Stack Command program
   main() : Object {
      out_string("> ") -- Output interrogative
	  input <- in_string() -- Apply input to local attribute
	  myStack <- new Stack.cons(input);  
   };
};