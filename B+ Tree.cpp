#include <climits>
#include <fstream>
#include <iostream>
#include <sstream>

using namespace std;

int degree;

// BP node
class Node
{
    bool isLeaf;                // boolean indicating if the node is a leaf node or not
    int *key, size;             // size is the no of keys in a node
    Node **children;                 // children is an array of nodes which points to the children
    friend class BPTree;

    public:
        Node();
};

// BP tree
class BPTree
{
    Node *root;                 // root of the B+ tree
    void insertInternal(int, Node *, Node *);
    Node *findParent(Node *, Node *);

    public:
        BPTree();
        void search(int);
        void insert(int);
        void display(Node *);
        Node *FirstLeaf(Node *);
        Node *getRoot();
};

// Constructor
Node::Node()
{
    key = new int[degree];
    children = new Node *[degree + 1];
    for(int i=0; i<degree+2; i++) {
        children[i] = NULL;
    }
}

// Initialising the B+ root
BPTree::BPTree()
{
    root = NULL;
}

// Find the parent node of a node
Node *BPTree::findParent(Node *curr, Node *child)
{
    Node *parent;
    // If current node is a leaf node or doesn't have a parent
    if(curr->isLeaf || (curr->children[0])->isLeaf)
        return NULL;
    // Traverse the tree
    for(int i = 0; i < curr->size + 1; i++)
    {
        // If the child is the child of curr
        if(curr->children[i] == child)
        {
            parent = curr;
            return parent;
        }
        // If not, traverse recursively
        else
        {
            parent = findParent(curr->children[i], child);
            if(parent != NULL)
                return parent;
        }
    }
    // Return parent node
    return parent;
}

// Inserting into a B+ tree
void BPTree::insert(int x)
{
    // If root is NULL
    if(root == NULL)
    {
        root = new Node;            // Create a new node and assign it to root
        root->key[0] = x;           // Assign the first key of the root as the new value
        root->isLeaf = true;        // Root will be a leaf
        root->size = 1;             // Only one element will be present in the root node
    }
    // If root is not NULL, traverse the rest of the B+ tree
    else
    {
        Node *curr = root;        // Node for traversing the B+ tree
        Node *parent;               // Node for storing details of parent
        // We traverse till we reach a leaf node to insert
        while(curr->isLeaf == false)
        {
            parent = curr;
            for(int i = 0; i < curr->size; i++)
            {
                // If the value to be inserted is less than the current key
                if(x < curr->key[i])
                {
                    // Move to the next child
                    curr = curr->children[i];
                    break;
                }
                // If we reach the last key
                if(i == curr->size - 1)
                {
                    // Move to the rightmost child
                    curr = curr->children[i + 1];
                    break;
                }
            }
        }
        // If the current node is not filled
        if(curr->size < degree)
        {
            int i = 0;
            // Skip all the keys that are less than the value to be inserted
            while(x > curr->key[i] && i < curr->size)
                i++;
            // Move the rest of the nodes to its right
            for(int j = curr->size; j > i; j--)
                curr->key[j] = curr->key[j - 1];
            // Insert the value at ith position (gap)
            curr->key[i] = x;
            // Increment the number of keys in the node
            curr->size++;
            // Set the last child as the second last child
            curr->children[curr->size] = curr->children[curr->size - 1];
            // Set the second last child as NULL
            curr->children[curr->size - 1] = NULL;
        }
        // If the current node is filled
        else
        {
            // Create a new node copyLeaf
            Node *copyLeaf = new Node;
            // Create a new array copyNode
            int copyNode[degree + 1];
            // Copy all the keys from curr to copyNode array
            for(int i = 0; i < degree; i++)
                copyNode[i] = curr->key[i];
            int i = 0, j;
            // Find a place to insert the new node
            while(x > copyNode[i] && i < degree)
                i++;
            // Right shift the keys to the right of the place to be inserted
            for(int j = degree + 1; j > i; j--)
                copyNode[j] = copyNode[j - 1];
            // Insert the new key at the ith position
            copyNode[i] = x;
            // Set the new leaf's isLeaf as true
            copyLeaf->isLeaf = true;
            // Since we are dividing, half the size of the current node
            curr->size = (degree + 1) / 2;
            // Set the size of copyLeaf as the number of keys we split
            copyLeaf->size = degree + 1 - (degree + 1) / 2;
            // Set the last child of current node as copyLeaf (Linked list)
            curr->children[curr->size] = copyLeaf;
            // Set the last child of the copyLeaf as the last child of original curr
            copyLeaf->children[copyLeaf->size] = curr->children[degree];
            // Set the last child of the original curr as NULL
            curr->children[degree] = NULL;
            // Copy the first values in order from copyNode to curr
            for(i = 0; i < curr->size; i++)
                curr->key[i] = copyNode[i];
            // Copy the last values in order from copyNode to copyLeaf
            for(i = 0, j = curr->size; i < copyLeaf->size; i++, j++)
                copyLeaf->key[i] = copyNode[j];
            // If curr is the root node
            if(curr == root)
            {
                Node *copyRoot = new Node;              // Create a new node copyRoot
                copyRoot->key[0] = copyLeaf->key[0];    // Set the first key of copyRoot as first key of copyLeaf
                copyRoot->children[0] = curr;              // Set the first child of copyRoot as the curr
                copyRoot->children[1] = copyLeaf;            // Set the second child of copyRoot as copyLeaf
                copyRoot->isLeaf = false;
                copyRoot->size = 1;
                root = copyRoot;                        // Set copyRoot as the new root
            }
            // If curr is not the root node
            else
            {
                // Insert recursively
                insertInternal(copyLeaf->key[0], parent, copyLeaf);
            }
        }
    }
}

// Insert an internal node
void BPTree::insertInternal(int x, Node *curr, Node *child)
{
    // If the current node is not filled
    if(curr->size < degree)
    {
        int i = 0;
        // Find a place to insert the new node
        while(x > curr->key[i] && i < curr->size)
            i++;
        // Right shift the keys to the right of the place to be inserted
        for(int j = curr->size; j > i; j--)
            curr->key[j] = curr->key[j - 1];
        // Right shift the child pointers to the right of the place to be inserted
        for(int j = curr->size + 1; j > i + 1; j--)
            curr->children[j] = curr->children[j - 1];
        // Insert the value at the ith position
        curr->key[i] = x;
        // Increment number of keys in the node
        curr->size++;
        // Set child as the right child of inserted key
        curr->children[i + 1] = child;
    }
    // If the current node is filled
    else
    {
        // Create a new node copyInternal
        Node *copyInternal = new Node;
        // Create a new array copyKey
        int copyKey[degree + 1];
        // Create a new node copychildren
        Node *copychildren[degree + 2];
        // Copy the keys in curr to copyKey
        for(int i = 0; i < degree; i++)
            copyKey[i] = curr->key[i];
        // Copy the pointers in curr to copychildren
        for(int i = 0; i < degree + 1; i++)
            copychildren[i] = curr->children[i];
        int i = 0, j;
        // Find a gap to insert the new key
        while(x > copyKey[i] && i < degree)
            i++;
        // Right shift keys from ith position
        for(int j = degree + 1; j > i; j--)
            copyKey[j] = copyKey[j - 1];
        // Insert the new key into copyKey
        copyKey[i] = x;
        // Right shift the pointer in copychildren
        for(int j = degree + 2; j > i + 1; j--)
            copychildren[j] = copychildren[j - 1];
        // Insert child as the right child of ith key
        copychildren[i + 1] = child;
        copyInternal->isLeaf = false;
        // Halve the size of curr
        curr->size = (degree + 1) / 2;
        copyInternal->size = degree - (degree + 1) / 2;
        // Insert the right most elements of copyKey to copyInternal
        for(i = 0, j = curr->size + 1; i < copyInternal->size; i++, j++)
            copyInternal->key[i] = copyKey[j];
        // Insert the right most pointers of copyKey to copyInternal
        for(i = 0, j = curr->size + 1; i < copyInternal->size + 1; i++, j++)
            copyInternal->children[i] = copychildren[j];
        // If curr is the root node
        if(curr == root)
        {
            // Create a new root node
            Node *copyRoot = new Node;
            // Add the last key of curr as the first key of copyRoot
            copyRoot->key[0] = curr->key[curr->size];
            copyRoot->children[0] = curr;                      // Add current node as the first child of copyRoot
            copyRoot->children[1] = copyInternal;                // Add copyInternal as the second child of copyRoot
            copyRoot->isLeaf = false;                       // Root is not a leaf
            copyRoot->size = 1;                             // Only one key present
            root = copyRoot;                                // Set copyRoot as the new root of the tree
        }
        else
        {
            // Insert recursively
            insertInternal(curr->key[curr->size], findParent(root, curr), copyInternal);
        }
    }
}

// Search for a node
void BPTree::search(int x)
{
    int level = 0;
    // If tree is empty
    if(root == NULL)
        cout << "Tree is empty\n";
    // Traverse through the tree
    else
    {
        Node *curr = root;
        // Traverse till we reach a leaf node
        while(curr->isLeaf == false)
        {
            for(int i = 0; i < curr->size; i++)
            {
                if(x == curr->key[i]) {
                    cout<<x<<" found at level "<<level<<endl;
                    return;
                }
                // If the element is less than the current key, we go to its left child
                if(x < curr->key[i])
                {
                    curr = curr->children[i];
                    level++;                // Increment the level when we go down
                    break;
                }
                // If we reach the last key, we set curr as the last child pointer
                if(i == curr->size - 1)
                {
                    curr = curr->children[i + 1];
                    level++;                // Increment the level when we go down
                    break;
                }
            }
        }
        // Traverse the leaf to find the value
        for(int i = 0; i < curr->size; i++)
        {
            // Print and return if we find the value
            if(curr->key[i] == x)
            {
                cout<<x<<" found at level "<<level<<endl;
                return;
            }
        }
    }
    cout<<x<<" is not found\n";
}

// Get the root node of the tree
Node *BPTree::getRoot()
{
    return root;
}

// Get the left most leaf of the node
Node *BPTree::FirstLeaf(Node *curr) {
    // Go to the first child of a node until it becomes a leaf node
    while(! curr->isLeaf) {
        curr = curr->children[0];
    }
    // Return the left most leaf node
    return curr;
}

// Print the elements in the tree
void BPTree::display(Node *curr)
{
    // If root is empty
    if(! curr) {
        cout<<"Tree is empty";
    }
    // Get the left most leaf of the tree
    curr = FirstLeaf(curr);
    // Traverse
    while(curr)
    {
        // Print all the keys in a node
        for(int i = 0; i < curr->size; i++)
            cout<<curr->key[i]<<" ";
        // Go to its right sibling
        curr = curr->children[curr->size];
    }
}


int main()
{
    BPTree node;
    cout<<"Enter the degree of the B+ Tree : ";
    cin>>degree;
    degree--;
    
    // Insert values into B+ trees
    node.insert(9);
    node.insert(8);
    node.insert(7);
    node.insert(6);
    node.insert(5);
    node.insert(4);
    node.insert(3);
    node.insert(2);
    node.insert(1);
    node.insert(10);
    node.insert(11);
    node.insert(12);
    node.insert(13);
    node.insert(14);
    node.insert(15);

    // Print the data in the tree
    cout<<"\nThe current records in the B+ Tree are:\n";
    node.display(node.getRoot());

    // Searching for a node
    int el;
    cout<<"\n\nEnter the element to be searched: ";
    cin>>el;
    node.search(el);
    cout<<endl;

    cout<<"Enter the element to be searched: ";
    cin>>el;
    node.search(el);
    cout<<endl;

    return 0;
}
