## search a jar for classes containing a specified method name

usage:<br>
&nbsp;./findClassMethod.sh jar-path [method-name]<br>
&nbsp;&nbsp;&nbsp;&nbsp;jar-path    - if alone, list all classes from the jar<br>
&nbsp;&nbsp;&nbsp;&nbsp;method-name - list only classes containing the method-name<br>

&nbsp;&nbsp;examples: <br>
&nbsp;&nbsp;&nbsp;&nbsp;__./findClassMethod.sh__ /usr/java/jdk1.8/jre/lib/ext/dnsns.jar lookupAllHostAddr<br>
&nbsp;&nbsp;&nbsp;&nbsp;find path -type f -name '*.jar' -exec __./findClassMethod.sh__ {} methodXY \;<br>
