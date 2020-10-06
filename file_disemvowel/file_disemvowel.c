#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#define BUF_SIZE 1024



/*
char *disemvowel(char *str) {
  int num = count_consonants(str);
  char *result = (char*) calloc(num + 1, sizeof(char));

  //looping over the string
  int i;
  int j = 0;
  int len = strlen(str);
  for(i = 0; i < len; i++) {
    if (!is_vowel(str[i])) {
      result[j] = str[i];
      j++;
    }
  }
  result[j] = '\0';
  return result;
}
*/


bool is_vowel(char c) {
  if (c == 'A' || c == 'a' || c == 'E' || c == 'e' || c == 'I' || c == 'i' || c == 'O' || c == 'o' || c == 'U' || c == 'u') {
     return true;
  }
  return false;
}

int copy_non_vowels(int num_chars, char* in_buf, char* out_buf) {
    /*
     * Copy all the non-vowels from in_buf to out_buf.
     * num_chars indicates how many characters are in in_buf,
     * and this function should return the number of non-vowels that
     * that were copied over.
     */ 
    //looping over the string
  int i;
  int j = 0;
  //int len = strlen(in_buf);
  for(i = 0; i < BUF_SIZE; i++) {
    if (!is_vowel(in_buf[i])) {
      out_buf[j] = in_buf[i];
      j++;
    }
  }
  //out_buf[j] = '\0';
  return j;
}

void disemvowel(FILE* inputFile, FILE* outputFile) {
    /*
     * Copy all the non-vowels from inputFile to outputFile.
     * Create input and output buffers, and use fread() to repeatedly read
     * in a buffer of data, copy the non-vowels to the output buffer, and
     * use fwrite to write that out.
     */
  char *buffer = (char*) calloc(BUF_SIZE,sizeof(char));
  size_t bytesRead = 0;
  char *outputBuffer = (char*) calloc(BUF_SIZE,sizeof(char));
  //bytesRead is numchars and buffer is in_buf, num is number of nonvowels
  while((bytesRead = fread(buffer,sizeof(char),BUF_SIZE,inputFile)) > 0){
    int count = copy_non_vowels(bytesRead,buffer,outputBuffer);
    fwrite(outputBuffer,sizeof(char),count, outputFile);
  }
  //fread(buffer, sizeof(char), BUF_SIZE, inputFile);
}

int main(int argc, char *argv[]) {
    // You should set these to `stdin` and `stdout` by default
    // and then set them to user specified files when the user
    // provides files names as command line arguments.
    FILE *inputFile = stdin;
    FILE *outputFile = stdout;

    // Code that processes the command line arguments
    // and sets up inputFile and outputFile.

    disemvowel(inputFile, outputFile);

    return 0;
}
