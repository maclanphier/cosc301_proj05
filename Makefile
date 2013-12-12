CC = clang
CFLAGS = -g -Wall `pkg-config fuse --cflags` `curl-config --cflags` `xml2-config --cflags` -I libs3-2.0/inc
HEADERS = s3fs.h
COMMON_OBJS = libs3_wrapper.o 
TEST_OBJS = libs3_wrapper_test.o
S3FS_OBJS = s3fs.o 
ALL_OBJS = $(COMMON_OBJS) $(TEST_OBJS) $(S3FS_OBJS)
LIBS = `pkg-config fuse --libs` `curl-config --libs` `xml2-config --libs`  -ls3

TARGET = libs3_wrapper_test s3fs

all: $(TARGET)

s3fs: $(HEADERS) $(COMMON_OBJS) $(S3FS_OBJS)
	$(CC) -o $@ $(COMMON_OBJS) $(S3FS_OBJS) $(LIBS)

libs3_wrapper_test: $(HEADERS) $(COMMON_OBJS) $(TEST_OBJS)
	$(CC) -o $@ $(COMMON_OBJS) $(TEST_OBJS) $(LIBS)

clean:
	$(RM) -f $(TARGET) $(ALL_OBJS) *~

.c.o: $(HEADERS)
	$(CC) $(CFLAGS) -c $<
