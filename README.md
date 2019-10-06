## search a jar for classes containing a specified method name

usage:<br/>
    findClassMethod.sh __jar-path__ [__method-name__]<br/>
        __jar-path__    - if alone, list all classes from the jar<br/>
        __method-name__ - list only classes containing the method-name<br/>

examples:<br/>
    __./findClassMethod.sh__ /usr/java/jdk1.8/jre/lib/ext/dnsns.jar lookupAllHostAddr<br/>
    find path -type f -name '*.jar' -exec __./findClassMethod.sh__ {} methodXY \;<br/>

