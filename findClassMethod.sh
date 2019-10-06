#!/bin/bash
#------------ findClassMethod.sh ---------------------
# search a jar for classes containing a specified method name.
#-----------------------------------------------------
function usage(){
  echo "usage:"
  echo "  ${0} jar-path [method-name]"
  echo "  jar-path    - if alone, list all classes from the jar"
  echo "  method-name - list only classes containing the method-name"
  echo ""
  echo "  examples: "
  echo "    ./findClassMethod.sh /usr/java/jdk1.8/jre/lib/ext/dnsns.jar lookupAllHostAddr"
  echo "    find path -type f -name '*.jar' -exec ./findClassMethod.sh {} methodXY \;"
}
ARGC=$#
JAR_PATH=$1
METHOD_NAME=$2
if [ $ARGC -eq 0 ] || [ ${JAR_PATH} == "--help" ]; then #  no parameters or help
  usage
  exit
fi

echo "--------------${JAR_PATH}-------------------" # just to see the progress
for entr in $(jar -tf $1) ; do # process all entries of a jar (*.class, ...)
  if [ "${entr:(-6)}" == ".class" ]; then
    CLASS=${entr//\//.}                  # convert a/b/c.class -> a.b.c.class
    CLASS_INFO=$(javap -classpath ${JAR_PATH} ${CLASS:0:-6}) # remove ".class"
    if [ "${#METHOD_NAME}" -eq 0 ]; then
      # no method parameter present
      echo "${CLASS_INFO}"
    else
      if [[ $CLASS_INFO =~ " "${METHOD_NAME}\( ]]; then # does class contain method?
        RED='\033[0;31m'
        NC='\033[0m' # No Color
        echo -e "${CLASS_INFO//${METHOD_NAME}/$RED${METHOD_NAME}$NC}"
      fi
    fi
  fi
done

