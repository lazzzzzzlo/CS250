#include <stdlib.h>
#include <stdio.h>



int main(void) {

  int start_index, end_index;
  char *in_string;
  char *out_string;

  //receive input from user
  printf("Enter a string: ");
  fgets(in_string, 200, stdin);
  printf("Enter the start index:");
  scanf("%d\n", &start_index);
  printf("Enter the end index:");
  scanf("%d\n", &end_index);

  //get substring
  out_string = sub_string(in_string, start_index, end_index);
   
  //print substring
  printf("The substring of the given string is '%s'\n",out_string);

  free(out_string);
}

