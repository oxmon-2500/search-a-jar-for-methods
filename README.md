# search-a-jar-for-methods
search a jar for classes containing a specified method name

usage:
  ./findClassMethod.sh jar-path [method-name]
  jar-path    - if alone, list all classes from the jar
  method-name - list only classes containing the method-name

  examples: 
    ./findClassMethod.sh /usr/java/jdk1.8/jre/lib/ext/dnsns.jar lookupAllHostAddr
    find path -type f -name '*.jar' -exec ./findClassMethod.sh {} methodXY \;
