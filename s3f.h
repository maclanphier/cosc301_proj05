//DO NOT USE A LINKED LIST - EACH DIRECTORY IS AN ARRAY OF THESE OBJECTS
//resizing should only go up

typedef struct{
char type;		//File (F), Directory (D) or Unused (U)
char name[256];		
struct stat metadata;
}s3dirent_t;
