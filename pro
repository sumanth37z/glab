program1

#include <stdio.h>
#include <stdlib.h>

struct day {
char *dayName;     
int date;          
char *activity;   
};
struct day *calendar;
void create() {
int i;
calendar = (struct day *)malloc(7 * sizeof(struct day));
for (i = 0; i < 7; i++) {  
    calendar[i].dayName = (char *)malloc(20 * sizeof(char));  
    calendar[i].activity = (char *)malloc(50 * sizeof(char));  
}
}
void read() {
int i;
for (i = 0; i < 7; i++) {
printf("\nEnter Day Name, Date and Activity:\n");
scanf("%s %d %s",
calendar[i].dayName,
&calendar[i].date,
calendar[i].activity);
}
}
void display() {
int i;
printf("\nWeekly Activity Report:\n");
for (i = 0; i < 7; i++) {
printf("%s  %d  %s\n",
calendar[i].dayName,
calendar[i].date,
calendar[i].activity);
}
}
int main() {
create();
read();
display();
return 0;
}


program 2:-

#include<stdio.h>
char str[50], pat[20], rep[20], res[50];
int c = 0, m = 0, i = 0, j = 0, k, flag = 0;
void stringmatch() {
while (str[c] != '\0') {
if (str[m] == pat[i]) {
i++;
m++;
if (pat[i] == '\0') {
flag = 1;
for (k = 0; rep[k] != '\0'; k++, j++) {
res[j] = rep[k];
}
i = 0;
c = m;
}
} else {
res[j] = str[c];
j++;
c++;
m = c;
i = 0;
}
}
res[j] = '\0';
}
void main() {
printf("Enter the main string:");
gets(str);
printf("\nEnter the pat string:");
gets(pat);
printf("\nEnter the replace string:");
gets(rep);
printf("\nThe string before pattern match is:\n %s", str);
stringmatch();
if (flag == 1)
printf("\nThe string after pattern match and replace is: \n %s ", res);
else
printf("\nPattern string is not found");
}

Program 3
#include<stdio.h>
#include<stdlib.h>
#define MAX 3 //you can change this size according to your requirementint 
s[MAX];
int top = -1;void push(int item);
int pop();
void palindrome();
void display();void main() {
int choice, item;
while (1) {
printf("\n\n\n\n----------Menu--------------: ");
printf("\n=>1.Push an Element to Stack and Overflow demo ");
printf("\n=>2.Pop an Element from Stack and Underflow demo");
printf("\n=>3.Palindrome demo ");
printf("\n=>4.Display ");
printf("\n=>5.Exit");
printf("\nEnter your choice: ");
scanf("%d", & choice);
switch (choice) {
case 1:
printf("\nEnter an element to be pushed: ");
scanf("%d", & item);
push(item);
break;
case 2:
item = pop();
if (item != -1)
printf("\nElement popped is: %d", item);
break;
case 3:
palindrome();
break;
case 4:
display();
break;
case 5:
exit(1);
default:
printf("\nPlease enter valid choice ");
break;
}
}
}void push(int item) {
if (top == MAX - 1) {
printf("\n~~~~Stack overflow~~~~");
return;
}top = top + 1;
s[top] = item;
}int pop() {
int item;
if (top == -1) {
printf("\n~~~~Stack underflow~~~~");
return -1;
}
item = s[top];
top = top - 1;
return item;
}void display() {
int i;
if (top == -1) {
printf("\n~~~~Stack is empty~~~~");
return;
}
printf("\nStack elements are:\n ");
for (i = top; i >= 0; i--)
printf("| %d |\n", s[i]);
}void palindrome() {
int flag = 1, i;
printf("\nStack content are:\n");
for (i = top; i >= 0; i--)
printf("| %d |\n", s[i]);printf("\nReverse of stack content are:\n");
for (i = 0; i <= top; i++)
printf("| %d |\n", s[i]);for (i = 0; i <= top / 2; i++) {
if (s[i] != s[top - i]) {
flag = 0;
break;
}
}
if (flag == 1) {
printf("\nIt is palindrome number");
} else {
printf("\nIt is not a palindrome number");
}
}

Program 4

#include <stdio.h>
#include <ctype.h>

char s[50];
int top = -1;

int pr(char c) {
    if (c=='^') return 3;
    if (c=='*'||c=='/'||c=='%') return 2;
    if (c=='+'||c=='-') return 1;
    return 0;
}

int main() {
    char infix[50], ch;
    int i=0;

    printf("Enter infix: ");
    scanf("%s", infix);

    while((ch=infix[i++])!='\0') {
        if(isalnum(ch))
            printf("%c", ch);
        else if(ch=='(')
            s[++top]=ch;
        else if(ch==')') {
            while(s[top]!='(')
                printf("%c", s[top--]);
            top--;
        }
        else {
            while(top!=-1 && pr(s[top])>=pr(ch))
                printf("%c", s[top--]);
            s[++top]=ch;
        }
    }

    while(top!=-1)
        printf("%c", s[top--]);

    return 0;
}

Progra 5a

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int i, top = -1;
int op1, op2, res, s[20];
char postfix[90], symb;void push(int item) {
top = top + 1;
s[top] = item;
}int pop() {
int item;
item = s[top];
top = top - 1;
return item;
}void main() {
printf("\nEnter a valid postfix expression:\n");
scanf("%s", postfix);
for (i = 0; postfix[i] != '\0'; i++) {
symb = postfix[i];
if (isdigit(symb)) {
push(symb - '0');
} else {
op2 = pop();
op1 = pop();
switch (symb) {
case '+':
push(op1 + op2);
break;
case '-':
push(op1 - op2);
break;
case '*':
push(op1 * op2);
break;
case '/':
push(op1 / op2);
break;
case '%':
push(op1 % op2);
break;
case '$':
case '^':
push(pow(op1, op2));
break;
default:
push(0);
}
}
}
res = pop();
printf("\n Result = %d", res);
}

program 5b

#include <stdio.h>
void tower(int n, int source, int temp, int destination)
{
if (n == 0)
return;
tower(n - 1, source, destination, temp);
printf("\nMove disc %d from %c to %c", n, source, destination);
tower(n - 1, temp, source, destination);
}
void main() {
int n;
printf("\nEnter the number of discs: \n");
scanf("%d", & n);
tower(n, 'A', 'B', 'C');
printf("\n\nTotal Number of moves are: %d", (int) pow(2, n) - 1);
}

program 6

#include <stdio.h> 
#include <stdlib.h>
#define MAX 3
char cq[MAX]; 
int f = -1, r = -1;
void insert(char x){
if ((r + 1) % MAX == f)
printf("\n\n~~Circular Queue Overflow~~"); 
else{
if (f == -1) f = r = 0;
else r = (r + 1) % MAX; 
cq[r] = x;
}
}
void delete(){
if (f == -1)
printf("\n\n~~Circular Queue Underflow~~"); 
else{
printf("\n\nDeleted element from the queue is: %c 
", cq[f]);
if (f == r) f = r = -1;
else f = (f + 1) % MAX;
}
}
void display(){ 
if (f == -1){
printf("\n\nCircular Queue Empty"); 
return;
}
printf("\nCircular Queue contents are:\nFront[%d]-> 
", f);
for (int i = f; i != r; i = (i + 1) % MAX) 
printf(" %c", cq[i]);
printf(" %c <-[%d]Rear", cq[r], r);
}
int main(){
int ch; char x; 
while (1){
printf("\n\n~~Main Menu~~\n==> 1. Insertion and 
Overflow Demo\n==> 2. Deletion and Underflow 
Demo\n==> 3. Display\n==> 4. Exit\nEnter Your Choice: 
");
scanf("%d", sch);
while(getchar()!= '\n'); // buffer clear
if (ch == 1){
printf("\n\nEnter the elementto be inserted:"); 
scanf("%c", sx);
insert(x);
}
else if (ch == 2) delete(); 
else if(ch == 3) display(); 
else if (ch == 4) exit(0);
else printf("\n\nPlease enter a valid choice");
}
}

Program 7

#include<stdio.h> 
#include<stdlib.h>
typedef struct n{
char u[25],nm[25],b[25]; 
int s; long p;
struct n *l;
}*N;
N st=NULL; int c=0;
N cr(){
N t=malloc(sizeof(*t)); 
if(!t) exit(1);
printf("\nEnter the usn,Name,Branch, sem,PhoneNo 
of the student:");
scanf(" %s %s %s %d %ld",t->u,t->nm,t->b,st->s,st-
>p);
t->l=NULL; c++; return t;
}
N ifr(){ N t=cr(); t->l=st; return t; }
N dfr(){
if(!st) return printf("\nLinked listis empty"),NULL; 
N t=st; st=t->l;
printf("\nThe Student node with usn:%s is deleted",t-
>u);
free(t); c--; return st;
}
N ien(){
N t=cr(),p=st; 
if(!st) return t;
while(p->l) p=p->l; 
p->l=t; return st;
}
N den(){
if(!st) return printf("\nLinked Listis empty"),NULL; 
if(!st->l){
printf("\nThe student node with the usn:%s is 
deleted",st->u);
free(st); c--; return NULL;
}
N p=st;
while(p->l->l) p=p->l;
printf("\nThe student node with the usn:%s is 
deleted",p->l->u);
free(p->l); p->l=NULL; c--; return st;
}
void dis(){
if(!st) return printf("\nNo Contents to display in SLL
\n");
printf("\nThe contents of SLL: \n"); 
int i=1;
for(N p=st;p;p=p->l)
printf("\n||%d|| USN:%s| Name:%s| Branch:%s| 
Sem:%d| Ph:%ld|",
i++,p->u,p->nm,p->b,p->s,p->p); 
printf("\n No of student nodes is %d \n",c);
}
void stk(){ 
int ch; 
for(;;){
printf("\n~~~Stack Demo using SLL~~~\n");
printf("\n1:Push operation \n2: Pop operation \n3: 
Display \n4:Exit \n");
printf("\nEnter your choice for stack demo:"); 
scanf(" %d",sch);
if(ch==1) st=ifr();
else if(ch==2) st=dfr(); 
else if(ch==3) dis();
else return;
}
}
int main(){ 
int ch,n; 
for(;;){
printf("\n~~~Menu~~~\nEnter your choice for SLL 
operation \n");
printf("\n1:Create SLL of Student 
Nodes\n2:DisplayStatus\n3:InsertAtEnd");
printf("\n4:DeleteAtEnd\n5:Stack Demo using 
SLL(Insertion and Deletion at Front)\n6:Exit \n");
printf("\nEnter your choice:"); 
scanf(" %d",sch);
if(ch==1){ printf("\nEnter the no of students:"); 
scanf(" %d",sn); while(n--) st=ifr(); }
else if(ch==2) dis();
else if(ch==3) st=ien(); 
else if(ch==4) st=den(); 
else if(ch==5) stk();
else if(ch==6) exit(0);
else printf("\nPlease enter the valid choice");
}
}

Program 8

#include<stdio.h> 
#include<stdlib.h>
typedef struct n{
char s[25],nme[25],d[10],g[25]; 
int sal; long p;
struct n *l,*r;
}*N;
N f=NULL;int c=0;
N cr(){
N t=malloc(sizeof(*t));
if(!t){printf("\nRunning out of memory");exit(0);} 
printf("\nEnter the
ssn,Name,Department,Designation,Salary,PhoneNo of 
the employee: \n");
scanf(" %s %s %s %s %d %ld",t->s,t->nme,t->d,t-
>g,st->sal,st->p);
t->l=t->r=NULL; c++; return t;
}
N ifr(){ N t=cr(); if(f) f->l=t,t->r=f; return t; }
N ien(){
N t=cr(),p=f; 
if(!f) return t;
while(p->r) p=p->r;
p->r=t; t->l=p; return f;
}
N dfr(){
if(!f) return printf("\nDoubly Linked Listis 
empty"),NULL;
N t=f; printf("\nThe employee node with the ssn:%s is 
deleted",t->s);
f=t->r; if(f) f->l=NULL; 
free(t); c--; return f;
}
N den(){
if(!f) return printf("\nDoubly Linked Listis 
empty"),NULL;
if(!f->r){
printf("\nThe employee node with the ssn:%s is 
deleted",f->s);
free(f); c--; return NULL;
}
N p=f; while(p->r->r) p=p->r;
printf("\nThe employee node with the ssn:%s is 
deleted",p->r->s);
free(p->r); p->r=NULL; c--; return f;
}
void dis(){
if(!f) return printf("\nNo Contents to display in DLL"); 
inti=1; for(N p=f;p;p=p->r)
printf("\nENode:%d||SSN:%s|Name:%s|Department:% 
s|Designation:%s|Salary:%d|Phone no:%ld",
i++,p->s,p->nme,p->d,p->g,p->sal,p->p); 
printf("\nNo of employee nodes is %d",c);
}
void deq(){ 
int ch; 
for(;;){
printf("\nDemo Double Ended Queue Operation");
printf("\n1:InsertQueueFront\n 2: 
DeleteQueueFront\n 3:InsertQueueRear\n
4:DeleteQueueRear\n 5:DisplayStatus\n 6: Exit\n"); 
scanf(" %d",sch);
if(ch==1) f=ifr();
else if(ch==2) f=dfr(); 
else if(ch==3) f=ien(); 
else if(ch==4) f=den(); 
else if(ch==5) dis();
else return;
}
}
int main(){ 
int ch,n;
for(;;){
printf("\n\n~~~Menu~~~");
printf("\n1:Create DLL of Employee
Nodes\n2:DisplayStatus\n3:InsertAtEnd\n4:DeleteAtE 
nd");
printf("\n5:InsertAtFront\n6:DeleteAtFront\n7:Double 
Ended Queue Demo using DLL\n8:Exit \n");
printf("\nPlease enter your choice:"); 
scanf(" %d",sch);
if(ch==1){printf("\nEnter the no of Employees: 
");scanf(" %d",sn);while(n--)f=ien();}
else if(ch==2) dis(); 
else if(ch==3) f=ien();
else if(ch==4) f=den(); 
else if(ch==5) f=ifr(); 
else if(ch==6) f=dfr(); 
else if(ch==7) deq(); 
else if(ch==8) exit(0);
else printf("\nPlease Enter the valid choice");
}
}

Program 9

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
struct node {
    int coef, px, py, pz;
    struct node *link;
};
struct node* create() {
    struct node *h = (struct node*)malloc(sizeof(struct node));
    h->link = h;
    return h;
}
void insert(struct node *h, int c, int x, int y, int z) {
    struct node *t = (struct node*)malloc(sizeof(struct node));
    t->coef = c; t->px = x; t->py = y; t->pz = z;
    t->link = h->link;
    h->link = t;
}
void readPoly(struct node *h) {
    int n, c, x, y, z;
    printf("Enter number of terms: ");
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        printf("Enter coef px py pz: ");
        scanf("%d%d%d%d", &c, &x, &y, &z);
        insert(h, c, x, y, z);
    }
}

void display(struct node *h) {
    struct node *p = h->link;
    while (p != h) {
        printf("%+dx^%dy^%dz^%d ", p->coef, p->px, p->py, p->pz);
        p = p->link;
    }
    printf("\n");
}
void evaluate(struct node *h, int x, int y, int z) {
    int sum = 0;
    struct node *p = h->link;
    while (p != h) {
        sum += p->coef * pow(x, p->px) * pow(y, p->py) * pow(z, p->pz);
        p = p->link;
    }
    printf("Polynomial Value = %d\n", sum);
}

struct node* addPoly(struct node *p1, struct node *p2) {
    struct node *p, *q, *res = create();
    p = p1->link;
    while (p != p1) {
        q = p2->link;
        while (q != p2) {
            if (p->px==q->px && p->py==q->py && p->pz==q->pz) {
                insert(res, p->coef + q->coef, p->px, p->py, p->pz);
                break;
            }
            q = q->link;
        }
        p = p->link;
    }
    return res;
}

int main() {
    struct node *P = create(), *P1 = create(), *P2 = create(), *PSUM;
    int x, y, z;
 printf("\nEnter Polynomial P(x,y,z)\n");
    readPoly(P);
printf("Enter x y z values: ");
    scanf("%d%d%d", &x, &y, &z);
    evaluate(P, x, y, z);
 printf("\nEnter Polynomial 1\n");
    readPoly(P1);
    printf("Enter Polynomial 2\n");
    readPoly(P2);
PSUM = addPoly(P1, P2);
 printf("\nPolynomial Sum:\n");
    display(PSUM);
 return 0;
}

Program 10

#include <stdio.h> 
#include <stdlib.h>
struct node { 
int data;
struct node *left, *right;
};
struct node* newNode(int x) {
struct node* t = (struct node*)malloc(sizeof(struct 
node));
t->data = x;
t->left = t->right = NULL; 
return t;
}
struct node* insert(struct node* root, int x) { 
if (root == NULL)
return newNode(x);
if (x < root->data)
root->left = insert(root->left, x); 
else
root->right = insert(root->right, x);
return root;
}
void inorder(struct node* root) { 
if (root!= NULL) {
inorder(root->left); 
printf("%d ", root->data); 
inorder(root->right);
}
}
void preorder(struct node* root) { 
if (root!= NULL) {
printf("%d ", root->data); 
preorder(root->left); 
preorder(root->right);
}
}
void postorder(struct node* root) { 
if (root!= NULL) {
postorder(root->left);
postorder(root->right); 
printf("%d ", root->data);
}
}
void search(struct node* root, int key) { 
if (root == NULL) {
printf("Element notfound\n"); 
return;
}
if (root->data == key) { 
printf("Elementfound\n"); 
return;
}
if (key < root->data) 
search(root->left, key);
else
search(root->right, key);
}
int main() {
struct node* root = NULL; 
int ch, key;
int a[] = {6,G,5,2,8,15,24,14,7,8,5,2};
int n = 12;
do {
printf("\n1.Create 
BST\n2.Inorder\n3.Preorder\n4.Postorder\n5.Search\n 
6.Exit\n");
printf("Enter choice:"); 
scanf("%d", sch);
switch (ch) { 
case 1:
root = NULL;
for (inti = 0;i < n;i++) 
root = insert(root, a[i]);
printf("BST Created\n"); 
break;
case 2:
printf("Inorder:"); 
inorder(root);
break;
case 3: 
printf("Preorder: "); 
preorder(root);
break;
case 4: 
printf("Postorder: "); 
postorder(root);
break;
case 5:
printf("Enter key: "); 
scanf("%d", skey); 
search(root, key); 
break;
case 6:
printf("Exit\n");
}
} while (ch != 6);
return 0;
}

program 11

#include <stdio.h>
int n, a[10][10], v[10];
void dfs(inti)
{
int j;
printf("%d ",i); 
v[i] = 1;
for (j = 0; j < n; j++)
if (a[i][j] == 1 ss v[j] == 0) 
dfs(j);
}
void bfs(int s)
{
int q[10], f = 0, r = -1, i; 
for (i = 0; i < n; i++)
v[i] = 0;
q[++r] = s;
v[s] = 1;
while (f <= r)
{
s = q[f++]; 
printf("%d ", s);
for (i = 0; i < n; i++)
if(a[s][i] == 1 ss v[i] == 0)
{
q[++r] = i;
v[i] = 1;
}
}
}
int main()
{
int i, j, s;
printf(“enter number of vertices :"); 
scanf("%d", sn);
printf("Matrix:\n"); 
for (i = 0; i < n;i++)
for (j = 0; j < n; j++) 
scanf("%d", sa[i][j]);
printf("Start: ");
scanf("%d", ss);
printf("DFS: ");
dfs(s);
printf("\nBFS: "); 
bfs(s);
return 0;
}
Program 12

#include <stdio.h>

#define SIZE 10   // m = number of memory locations

int ht[SIZE];

void insert(int key)
{
    int index = key % SIZE;

    // Linear probing for collision resolution
    while (ht[index] != -1)
    {
        index = (index + 1) % SIZE;
    }

    ht[index] = key;
}

void display()
{
    int i;
    printf("\nHash Table:\n");
    for (i = 0; i < SIZE; i++)
    {
        if (ht[i] == -1)
            printf("%d : Empty\n", i);
        else
            printf("%d : %d\n", i, ht[i]);
    }
}

int main()
{
    int n, key, i;

    // Initialize hash table
    for (i = 0; i < SIZE; i++)
        ht[i] = -1;

    printf("Enter number of employee records: ");
    scanf("%d", &n);

    printf("Enter 4-digit employee keys:\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &key);
        insert(key);
    }

    display();
    return 0;
}
