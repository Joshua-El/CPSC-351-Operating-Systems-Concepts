#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <time.h>

pthread_mutex_t myMutex = PTHREAD_MUTEX_INITIALIZER;

struct node
{
  long  info;
  node *left, *right;
};

node* t = NULL;


void insert(node* &p, int x)
{
  if(p==NULL)
  {
    p = new node; p->info = x;
    p->left = NULL; p->right = NULL;
  }
  else
  {
    if (x < p->info) insert(p->left, x);
	  if (x > p->info) insert(p->right, x);
  }
}

void show(node* p)
{
	if (p != NULL)
	{
	  show(p->left);
  	std::cout << p->info << " ";
  	show(p->right);
  }
}

void deleteBST(node* &t)
{
	if (t != NULL)
	{
		deleteBST(t->left);
		deleteBST(t->right);
		delete t;
	}
}

void* thread(void* arg)
{
  #define ARRAY_SIZE 100
  long x;

  for( long i = 0; i < ARRAY_SIZE; i++)
  {
    x = rand() % 100000;

    if(pthread_mutex_lock(&myMutex) < 0)
    {
      perror("pthread_mutex_lock");
      exit(1);
    }

    for (long i = 0; i < ARRAY_SIZE; ++i)
    {
      insert(t, x);
    }

    if(pthread_mutex_unlock(&myMutex) < 0)
     {
       perror("pthread_mutex_unlock");
       exit(1);
     }
  }
   pthread_exit(0);
 }

int main(int argc, char *argv[])
{
  srand (time(NULL));
  int numThreads;

  if(argc != 2)
  {
    fprintf(stderr, "not enough input\n");
    return -1;
  }

  if((numThreads = atoi(argv[1])) < 0)
  {
    fprintf(stderr, "%d invalid input.\n", atoi(argv[1]));
    return -1;
  }

  pthread_t threadIds[numThreads];

  for(int i = 0; i < numThreads; i++)
  {
    if(pthread_create(&threadIds[i], NULL, thread, NULL) != 0)
    {
      perror("pthread_create");
      exit(-1);
    }
  }
  printf("Threads created = %s\n", argv[1]);

  for(int threadId = 0; threadId < numThreads; threadId++)
  {
    if(pthread_join(threadIds[threadId], NULL) != 0)
    {
      perror("pthread_join");
      exit(-1);
    }
  }

  show(t); std::cout << "\n";
  deleteBST(t);
  return 0;
}
