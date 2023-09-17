CC = gcc
LDFLAGS =
CFLAGS = -Wall -O0 -std=c99

SOURCEDIR = src
BUILDDIR = build
SRCS = $(wildcard $(SOURCEDIR)/*.c)
OBJS = $(addprefix $(BUILDDIR)/,$(notdir $(SRCS:.c=.o)))

all : dir test 

dir :
	mkdir -p $(BUILDDIR)

test : $(OBJS)
	$(CC) -o $@ $(CFLAGS) $(OBJS) $(LDFLAGS)

$(BUILDDIR)/%.o : $(SOURCEDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf test $(BUILDDIR)