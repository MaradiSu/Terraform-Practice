# arguements
image_id = "abc123"

# blocks

resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}

/*Argument names, block type names,
and the names of most Terraform-specific 
constructs like resources, input variables, etc.
are all identifiers.*/


#Comments
//The Terraform language supports three different syntaxes for comments:

/*


# begins a single-line comment, ending at the end of the line.
// also begins a single-line comment, as an alternative to #.
/* and */ 
#are start and end delimiters for a comment that might span over multiple lines.
