#include<iostream>
#include<cstdlib>
using namespace std;
class tr
{
	public:
	int data;
	tr *left;
	tr *right;
	void ins(tr *,tr *);
}*newnode,*root,*obj,*newptr,*new_node,*ptr;

tr* newno()
{
	int n;
	cout<<"Enter data you want to insert: ";
	cin>>n;
	newptr=new tr;
	newptr->data=n;
	newptr->left=NULL;
	newptr->right=NULL;
	return newptr;
}

void tr::ins(tr *root,tr *newnode)
{
	if(root->data >= newnode->data)
	{
		if(root->left==NULL)
		root->left=newnode;
		else
		ins(root->left,newnode);
	}
	if(root->data < newnode->data)
	{
		if(root->right==NULL)
		root->right=newnode;
		else
		ins(root->right, newnode);
	}
}

int main()
{
	root=NULL;
	new_node=newno();
	if(root==NULL)
    root=new_node;
    else	
    obj->ins(root,new_node);
	return 0;
}
