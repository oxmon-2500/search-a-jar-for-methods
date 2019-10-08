## search a jar for classes containing a specified method name

<pre>
usage:<br/>
    findClassMethod.sh __jarClassPath__ [__method-name__]<br/>
        __jarClassPath__  - if alone, list all classes from the jar/class<br/>
        __method-name__   - list only classes containing the method-name<br/>

examples:<br/>
    __./findClassMethod.sh__ /usr/java/jdk1.8/jre/lib/ext/dnsns.jar lookupAllHostAddr<br/>
    find path -type f -name '*.jar' -exec __./findClassMethod.sh__ {} methodXY \;<br/>
    find path -type f -regex '.+\.jar\|.+\.class' -exec __./findClassMethod.sh__ {} methodXY \;<br/>

</pre>

sample output:
<style>
 #pr {background-color:black; color:white;}
 #cl {color:green;}
 #mt {color:red}
</style>
		
<pre id="pr">
$ ./findClassMethod.sh test/test_jar.jar toString
--------------test/test_jar.jar-------------------
Compiled from "FailedError.java"
public class <span id="cl">org.szb.FailedError</span> extends java.lang.AssertionError {
  public org.szb.FailedError();
  public boolean isExpectedDefined();
  public boolean isActualDefined();
  public org.szb.ObjWrapper getExpected();
  public org.szb.ObjWrapper getActual();
  public java.lang.String <span id="mt">toString</span>();
}
Compiled from "ObjWrapper.java"
public final class <span style="color:green">org.szb.ObjWrapper</span> implements java.io.Serializable {
  public static org.szb.ObjWrapper create(java.lang.Object);
  public java.io.Serializable getValue();
  public java.lang.String getStringRepresentation();
  public int getIdentityHashCode();
  public java.lang.String <span id="mt">toString</span>();
  static {};
}
</pre>
