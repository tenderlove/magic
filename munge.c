#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  char c;
  int pflag, ch;

  pflag = 0;
  while((ch = getopt(argc, argv, "p")) != -1) {
      switch(ch) {
          case 'p':
              pflag = 1;
              break;
          default:
              break;
      }
  }

  while((c = getc(stdin)) != EOF) {
    unsigned int ch = (unsigned int)c;
    if(! pflag) {
        switch(ch) {
          case -105:
            printf("-");
            break;
          case -108:
            printf("\"");
            break;
          case -109:
            printf("\"");
            break;
          case -111:
            printf("'");
            break;
          case -28:
            printf("a");
            break;
          case -103: /* Supposed to be a TM. */
            printf("TM");
            break;
          case -106: /* Supposed to be a -. */
            printf("-");
            break;
          case -87: /* Supposed to be a CpyRight. */
            break;
          case -58: /* Supposed to be a AE. */
            printf("AE");
            break;
          case -110: /* Supposed to be a '. */
            printf("'");
            break;
          default:
            printf("%c", c);
            break;
        }
    } else {
        printf("%d: %c\n", (int)c, c);
    }
  }

  return 0;
}
