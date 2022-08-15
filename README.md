TableGen
-----

### Parsing with TableGen

* `llvm::Records` is used to store entries of classes, MPLoc and RecordKeeper 
*  RecordKeeper stores `llvm::Records` using `std::unique_ptr<Record>` in pairs of std::vector and `unqiue_ptr`.

### TODO1

Replicate `llvm::RecordKeeper` with `std::vector<...>` as a class memeber and find out why it segfaults [done]
	More Info
	: std::pair is returned as a reference, it can't be assigned directly aka pushing it to vector. 

Implement a tree structure where `llvm::Record` being a node in `llvm::RecordKeeper` being the placeholder for the tree. (Similarly add `llvm::RecordKeeper::Tree::insert(Record Value)`)

Replicate methods of `llvm::Record` in `llvm::RecordKeeper`.

Understand how the Tree structure works (instead of using vectors or actually replacing it using vectors)
#### Tried Methods
* Used pointer of pointers to store addresss of value returned by std::make_pair, but the shortcoming is that the pointer inside the pointer range was not being set in addClassvec. 

* Used a vector containing pointer, however either get std::bad_alloc or exception at termination of class. Weirldly `idx` was also containing some weird values.

* Using return reference of std::make_pair to vector, but segfault at assignment.

* implement own recordkeeping with vectors instead of `classes`

### Clues

Global vairable should be set. `Classes` is something that might not be set at the location of expression. 

add std::string to std::pair as either an unique ptr or ptr;

use std::make_pair instead of allocating the pointer  


### Take Aways

The destructor was not clearing the vector, resulting in very large vectors, clearning the vector using clear() in the case of std::string values and release() in terms of std::unique_ptr values

### Issues 

In `const` qualifiers, can't iterate through vector containing `std::unqiue_ptr`. [Will add the call stack later]
(`Unique_ptr`s can not be used in a const qualifed method, TODO: find out the reason why)


