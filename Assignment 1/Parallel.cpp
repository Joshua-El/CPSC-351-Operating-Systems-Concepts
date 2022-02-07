#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
using namespace std;

//Parent process
int main()
{

  // Get urls from txt
  vector<string> URLS;

  ifstream fin;
  fin.open("urls.txt");
  if (!fin.is_open()) {
    cout << "error unable to open file\n";
    exit(0);
  }

  string str;
  while (getline(fin, str)) {
    if(str.size() > 0)
        URLS.push_back(str);
  }

  int count = URLS.size();
  pid_t  pid;
  for (int i = 0; i < count;i++)
  {
  pid = fork();

  if (pid < 0) { /* error occurred */
      fprintf(stderr, "Fork Failed");
      exit(-1);
  }
  else if (pid == 0) { /* child process */

      if(execlp("wget", "wget", URLS.back().c_str(), NULL) < 0)
      {
          perror("execlp");
          exit(-1);
      }

      printf("Yay! I did my homework! Now I can play! :-)\n");
    }

      URLS.pop_back();
  }

  for (int i = 0; i < count;i++)
  {
    int exitedChildPid = wait (NULL);

    // Error checks
    if(exitedChildPid < 0)
    {
        perror("wait");
      exit(-1);
    }
    printf ("Child Complete %d\n", exitedChildPid);
  }
}
