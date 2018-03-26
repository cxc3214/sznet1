package cxc.test.jna;

import com.sun.jna.Library;
import com.sun.jna.Native;

public class Dll {
    public interface TestDll1 extends Library { 
        TestDll1 INSTANCE = (TestDll1)Native.loadLibrary("libmydll", TestDll1.class);
        public void say();
        public int send();
}
     public static void main(String[] args) {
         TestDll1.INSTANCE.say();
     }
}