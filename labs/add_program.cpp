//
// Created by shengjia on 4/21/16.
//
#include <cstdio>
#include <sys/stat.h>

int fsize(const char *filename) {
  struct stat st;

  if (stat(filename, &st) == 0)
    return st.st_size;

  return -1;
}

char *match_substr(char *str, char *substr, int str_len, int substr_len) {
  for (int i = 0; i < str_len - substr_len; i++) {
    for (int j = 0; j < substr_len; j++) {
      if (str[i + j] != substr[j]) {
        break;
      } else if (j == substr_len - 1) {
        return str + i;
      }
    }
  }
  return NULL;
}

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("Usage: add_program input_file program_file\n");
    return -1;
  }

  int infile_size = fsize(argv[1]);
  int progfile_size = fsize(argv[2]);
  if (infile_size < 0 || progfile_size < 0) {
    printf("Cannot query file size\n");
    return -1;
  }
  if (progfile_size > 8192) {
    printf("Program file cannot exceed 8192 bytes\n");
    return -1;
  }
  FILE *infile = fopen(argv[1], "rb");
  FILE *progfile = fopen(argv[2], "rb");
  if (infile == NULL) {
    printf("Input file not found\n");
    return -1;
  }
  if (progfile == NULL) {
    printf("Program file not found\n");
    return -1;
  }
  //printf("%d %d\n", infile_size, progfile_size);
  char *infile_content = new char[infile_size];
  char *progfile_content = new char[progfile_size];
  int read_count;
  if ((read_count = fread(infile_content, 1, infile_size, infile)) != infile_size) {
    printf("Warning: expecting %d bytes, received %d bytes\n", infile_size, read_count);
  };
  if ((read_count = fread(progfile_content, 1, progfile_size, progfile)) != progfile_size) {
    printf("Warning: expecting %d bytes, received %d bytes\n", progfile_size, read_count);
  }

  char magic[] = {'u', 's', 'e', 'r', 'p', 'r', 'o', 'g', 'r', 'a', 'm',
                  0x92, 0x23, 0x46, 0x88, 0xA6, 0xE5, 0x77, 0x02};
  int magic_size = 11 + 8;

  char *insert_loc = match_substr(infile_content, magic, infile_size, magic_size);
  if (insert_loc == NULL) {
    printf("Cannot find magic string\n");
    return -1;
  }
  //printf("%d\n", (int)insert_loc);
  if (match_substr(insert_loc + 1, magic, infile_size - (insert_loc - infile_content + 1), magic_size) != NULL) {
    printf("Found more than one magic locations\n");
    return -1;
  }

  for (int i = 0; i < progfile_size; i++) {
    insert_loc[i] = progfile_content[i];
  }

  fclose(infile);
  fclose(progfile);

  FILE *outfile = fopen(argv[1], "wb");
  fwrite(infile_content, 1, infile_size, outfile);
  fclose(outfile);
  return 0;
}

