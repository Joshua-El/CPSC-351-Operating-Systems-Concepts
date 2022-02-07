#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
/* The prototypes */
void parent();
void child1();
void child2();
void child3();
void child4();
void child5();
void child6();
void child7();
/**
 * The function called by the FIRST child.
 */
void child1()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
pid_t  pid;

/* fork another process */
pid = fork();

if (pid < 0) { /* error occurred */
  fprintf(stderr, "Fork Failed");
  exit(-1);
}
else if (pid == 0) { /* child process */
  child2();
  exit(-1);
}
else { /* parent process */
/* parent will wait for the child to complete */

  // Wait for the child to terminate
  int exitedChildPid = wait (NULL);

  // Error checks
  if(exitedChildPid < 0)
  {
    perror("wait");
    exit(-1);
  }
}

/* fork another process */
pid = fork();

if (pid < 0) { /* error occurred */
  fprintf(stderr, "Fork Failed");
  exit(-1);
}
else if (pid == 0) { /* child process */
  child3();
  exit(-1);
}
else {
  int exitedChildPid = wait (NULL);
  if(exitedChildPid < 0)
  {
    perror("wait");
    exit(-1);
  }
  exit(0);
}

//TODO: Fill me in
}
/**
 * The function called by the SECOND child.
 */
void child2()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
pid_t  pid;

/* fork another process */
pid = fork();

if (pid < 0) { /* error occurred */
  fprintf(stderr, "Fork Failed");
  exit(-1);
}
else if (pid == 0) { /* child process */
  child4();
  exit(-1);
}
else { /* parent process */
/* parent will wait for the child to complete */
  // Wait for the child to terminate
  int exitedChildPid = wait (NULL);

  // Error checks
  if(exitedChildPid < 0)
  {
    perror("wait");
    exit(-1);
  }
}
/* fork another process */
pid = fork();

if (pid < 0) { /* error occurred */
  fprintf(stderr, "Fork Failed");
  exit(-1);
}
else if (pid == 0) { /* child process */
  child5();
  exit(-1);
}
else { /* parent process */
/* parent will wait for the child to complete */
  // Wait for the child to terminate
  int exitedChildPid = wait (NULL);

  // Error checks
  if(exitedChildPid < 0)
  {
    perror("wait");
    exit(-1);
  }
  exit(0);
}
//TODO: Fill me in
}
/**
 * The function called by the THIRD child.
 */
void child3()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
pid_t  pid;

/* fork another process */
pid = fork();

if (pid < 0) { /* error occurred */
  fprintf(stderr, "Fork Failed");
  exit(-1);
}
else if (pid == 0) { /* child process */
  child6();
  exit(-1);
}
else { /* parent process */
/* parent will wait for the child to complete */
  // Wait for the child to terminate
  int exitedChildPid = wait (NULL);

  // Error checks
  if(exitedChildPid < 0)
  {
    perror("wait");
    exit(-1);
  }
}
/* fork another process */
pid = fork();

if (pid < 0) { /* error occurred */
  fprintf(stderr, "Fork Failed");
  exit(-1);
}
else if (pid == 0) { /* child process */
  child7();
  exit(-1);
}
else { /* parent process */
/* parent will wait for the child to complete */
  // Wait for the child to terminate
  int exitedChildPid = wait (NULL);

  // Error checks
  if(exitedChildPid < 0)
  {
    perror("wait");
    exit(-1);
  }
  exit(0);
}
}
/**
 * The function called by the FOURTH child.
 */
void child4()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
}
/**
 * The function called by the FIFTH child.
 */
void child5()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
}
/**
 * The function called by the SIXTH child.
 */
void child6()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
}
/**
 * The function called by the SEVENTH child.
 */
void child7()
{
fprintf(stderr, "I am child pid=%d; my parent is pid=%d\n", getpid(),
getppid());
}
/**
 * The function called by the parent
 */
void parent()
{
fprintf(stderr, "I am the original parent; my process ID is pid=%d\n",
getpid());

  pid_t  pid;

	/* fork another process */
	pid = fork();

	if (pid < 0) { /* error occurred */
		fprintf(stderr, "Fork Failed");
		exit(-1);
	}
	else if (pid == 0) { /* child process */
    child1();
    exit(-1);
	}
	else { /* parent process */
	/* parent will wait for the child to complete */

		// Wait for the child to terminate
		int exitedChildPid = wait (NULL);

		// Error checks
		if(exitedChildPid < 0)
		{
			perror("wait");
			exit(-1);
		}
		exit(0);
	}

}
/**
 * The main function
 */
int main()
{
parent();
}
