from multiprocessing import Process
from threading import Thread
import os

from numpy import square

def square_numbers():
    for i in range(100):
        i * i

processes = []
num_processes = os.cpu_count()
threads = []
num_threads = 10

# create process
for i in range(num_processes):
    p = Process(target=square_numbers)
    processes.append(p)

# create threads
for i in range(num_threads):
    t = Thread(target=square_numbers)
    threads.appends(t)


# start
for p in processes:
    p.start()

for t in threads:
    t.start()

# join
for p in processes:
    p.join()

for t in threads:
    t.join()


print("End Main")




