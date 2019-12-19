import threading
import time

class testAndSet():

    #lock variable used in test and set is defined here
    Lock = 0

    def testnSet(self,*args):
        if self.Lock == 0:
            self.Lock = 1
            # The critical section goes here...
            self.criticalsection(args[0])

        else:
            #while other process is executing current process is waiting
            while self.Lock == 1:
                print(f"Process {args[0]} waiting")


    def criticalsection(self,i):
        print(f" Process {i} Entered Critical Section!. Perform operation on shared resource")
        #exit section
        self.Lock = 0

    def main(self):
        # Running all the 5 processes using thread module and  passing process index as args since Thread supports args and kwargs argument only
        t1 = threading.Thread(target = self.testnSet, args = (0,))          
        t1.start()
        t2 = threading.Thread(target = self.testnSet, args = (1,)) 
        t2.start()
        t3 = threading.Thread(target = self.testnSet, args = (2,))
        t3.start()
        t4 = threading.Thread(target = self.testnSet, args = (3,)) 
        t4.start()
        t5 = threading.Thread(target = self.testnSet, args = (4,))
        t5.start()

if __name__=="__main__":
    t = testAndSet()
    t.main()