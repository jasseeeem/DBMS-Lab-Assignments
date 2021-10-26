#include <iostream>
#include <math.h>
using namespace std;

class Node {
    int *keys;              // array of keys
    int t;                  // min-degree
    Node **Children;        // Array of nodes for storing children
    int n;                  // Number of keys in a node
    bool leaf;              // Storing if the node is a leaf or not

    public:
        Node(int temp, bool bool_leaf);
        void insertVacant(int k);
        void breakChild(int i, Node *y);
        void print();
        Node *search(int k);
        friend class Tree;                     //Tree can access private members of Node
};

class Tree {
    Node *root;                        // Root of the B tree
    int t;                             // min-degree of the B tree

    public:
        Tree(int temp) {
            root = NULL;
            t = temp;
        }
        void print() {
            if (root) root->print();
        }
        Node *search(int k) {
            return (root == NULL) ? NULL : root->search(k);
        }
        void insert(int k);
};

// Function to initialise the node
Node::Node(int t1, bool leafInitial) {

    // Copying minimum degree and leaf value
    t = t1;
    leaf = leafInitial;

    // Initialising array memory for keys and children
    keys = new int[2 * t - 1];
    Children = new Node *[2 * t];

    // Initialising number of children as 0
    n = 0;
}

// Function to do inorder traversal and print the tree
void Node::print() {
    int i;
    // First we traverse through n keys and n children
    for(i=0; i<n; i++) {
        // If current node is not a leaf, traverse its child first
        if (!leaf)
            Children[i]->print();
        cout<<" "<<keys[i];
    }
    // Traverse the subtree rooted with the remaining child
    if(!leaf)
        Children[i]->print();
}

// Function to search the tree
Node *Node::search(int k) {
    int i = 0;

    // Finding the first key that is less than or equal to k
    while (i < n && k > keys[i])
        i++;

    // If the key is equal to k, we return the current node
    if (keys[i] == k)
        return this;

    // Otherwise if the node is a leaf, we return nothing
    if (leaf == true)
        return NULL;

    // If the node is not a leaf, we go to its child
    return Children[i]->search(k);
}

// Function to insert into the tree
void Tree::insert(int k) {
    if (root == NULL) {                     // checking if tree is empty
        root = new Node(t, true);           // allocating memory for the root
        root->keys[0] = k;                  // setting k as the first key of root
        root->n = 1;                        // setting number of keys as 1
    } 
    else {
        if (root->n == 2 * t - 1) {                 // if root node is full
            Node *s = new Node(t, false);
            s->Children[0] = root;                         // setting current root as the first child of old root
            s->breakChild(0, root);                 // split the current root 
            int i = 0;                              
            if (s->keys[0] < k)                     // skip all the elements less than the new value
                i++;
            s->Children[i]->insertVacant(k);               // insert the new value as the ith key
            root = s;                               // setting root as the new root
        } 
        else root->insertVacant(k);                 // if root node is not full insert into the current node
    }
}

// Function to insert into a node that can accept extra keys
void Node::insertVacant(int k) {
    // We start from the rightmost element
    int i = n - 1;
    // If current node is a leaf
    if (leaf == true) {
        // while loop to find space for the new element
        while (i >= 0 && keys[i] > k) {
            keys[i + 1] = keys[i];                  // we swap the next element with the previous element
            i--;
        }
        // inserting new element in the gap found
        keys[i + 1] = k;
        // incrementing number of keys
        n = n + 1;
    } 
    // If the current node is not a leaf
    else {
        // while loop to find space for the new element
        while (i >= 0 && keys[i] > k)
            i--;
        // checking if the node is full
        if (Children[i + 1]->n == 2 * t - 1) {
            breakChild(i + 1, Children[i + 1]);            // breaking the node if its full
            if (keys[i + 1] < k)
                i++;
        }
        // inserting the value to the node by recursion
        Children[i + 1]->insertVacant(k);
    }
}

// Function to break a node to two and move one of the nodes to the top node
void Node::breakChild(int i, Node *y) {
    // Allocating memory for a new node
    Node *z = new Node(y->t, y->leaf);
    // this new node will store t-1 keys of y
    z->n = t - 1;
    // copying last t-1 keys of y to z
    for (int j = 0; j < t - 1; j++)
        z->keys[j] = y->keys[j + t];
    // copying the last t children of y to z
    if (y->leaf == false) {
        for (int j = 0; j < t; j++)
            z->Children[j] = y->Children[j + t];
    }
    // removing t keys from y (t-1 + 1(middle element))
    y->n = t - 1;
    // creating space for new child
    for (int j = n; j >= i + 1; j--)
        Children[j + 1] = Children[j];
    // setting the new child to as this node's child
    Children[i + 1] = z;
    // moving all greater keys to its right
    for (int j = n - 1; j >= i; j--)
        keys[j + 1] = keys[j];
    // setting the node's key as the middle key of y
    keys[i] = y->keys[t - 1];
    // increment the number of keys in current node
    n = n + 1;
}

int main() {

    int degree = 4, n;

    Tree t(ceil(degree/2));

    // 10 inserts 
    t.insert(10);
    t.insert(11);
    t.insert(12);
    t.insert(13);
    t.insert(14);
    t.insert(15);
    t.insert(16);
    t.insert(17);
    t.insert(18);
    t.insert(19);

    // 5 more inserts
    t.insert(20);
    t.insert(21);
    t.insert(22);
    t.insert(23);
    t.insert(24);

    // 5 more inserts
    t.insert(25);
    t.insert(26);
    t.insert(27);
    t.insert(28);
    t.insert(29);

    cout<<"The current records in the B-Tree are:\n";
    t.print();

    int el;
    cout<<"\n\nEnter the element to be searched: ";
    cin>>el;
    if(t.search(el)) cout<<el<<" is present in the tree\n\n";
    else cout<<el<<" is not present in the tree\n\n";

    cout<<"Enter the element to be searched: ";
    cin>>el;
    if(t.search(el)) cout<<el<<" is present in the tree\n\n";
    else cout<<el<<" is not present in the tree\n\n";

    return 0;
}
