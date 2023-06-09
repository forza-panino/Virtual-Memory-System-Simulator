CC=gcc
CCOPTS=--std=gnu99 -Wall -D_LIST_DEBUG_ -D_MULTI_CORE_
CCLIBS=-lm
AR=ar

OBJS=linked_list.o\
     fake_process.o\
     fake_os.o\
	 minheap.o

HEADERS=linked_list.h  fake_process.h minheap.h

BINS=fake_process_test sched_sim

#disastros_test

.phony: clean all


all:	$(BINS)

%.o:	%.c $(HEADERS)
	$(CC) $(CCOPTS) -c -o $@  $<

fake_process_test:	fake_process_test.c $(OBJS)
	$(CC) $(CCOPTS) -o $@.out $^ $(CCLIBS)

sched_sim:	sched_sim.c $(OBJS)
	$(CC) $(CCOPTS) -o $@.out $^ $(CCLIBS)

clean:
	rm -rf *.o *~ $(OBJS) $(addsuffix .out, $(BINS))
