#include <stdio.h>
#include <stdlib.h>

char *sub_string(char * string, int start, int end) {
  char *sub_str = calloc(end - start + 2,sizeof(char));//length of str + null terminator
  int j = 0;
  for(int i = start - 1; i < end; i++) {
    sub_str[j] = string[i]; 
    j++;
  } 
  return sub_str;
} 
