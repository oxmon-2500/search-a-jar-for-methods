#!/bin/bash
#------------ findClassMethod.sh ---------------------
# search a jar/class for classes containing a specified method name.
#-----------------------------------------------------
function usage(){
  echo "usage:"
  echo "  ${0} jarClassPath [method-name]"
  echo "  jarClassPath - if alone, list all classes from the jar/class"
  echo "  method-name  - list only classes containing the method-name"
  echo ""
  echo "  examples: "
  echo "    ./findClassMethod.sh /usr/java/jdk1.8/jre/lib/ext/dnsns.jar lookupAllHostAddr"
  echo "    find path -type f -name '*.jar' -exec ./findClassMethod.sh {} methodXY \;"
  echo "    find path -type f -regex '.+\.jar\|.+\.class' -exec ./findClassMethod.sh {} methodXY \;"
}
ARGC=$#
JAR_PATH=$1
METHOD_NAME=$2
if [ $ARGC -eq 0 ] || [ ${JAR_PATH} == "--help" ]; then #  no parameters or help
  usage
  exit
fi

function analyseClass(){
    CLASS_INFO=$(javap $1) 
    if [ "${#METHOD_NAME}" -eq 0 ]; then
      # no method parameter present
      echo "${CLASS_INFO}"
    else
      if [[ $CLASS_INFO =~ " "${METHOD_NAME}\( ]]; then # does class contain method?
        RED='\033[0;31m'
        GREEN='\033[0;32m'
        NCO='\033[0m' # No Color
        if [[ "$CLASS_INFO" =~ class" "([^" "]+)" " ]]; then 
          # color class name
          CLASS_INFO=${CLASS_INFO//class ${BASH_REMATCH[1]}/class $GREEN${BASH_REMATCH[1]}$NCO}
	    fi
	    # color method name
        echo -e "${CLASS_INFO//${METHOD_NAME}/$RED${METHOD_NAME}$NCO}"
      fi
    fi
}

echo "--------------${JAR_PATH}-------------------" # just to see the progress
if [ "${JAR_PATH:(-6)}" == ".class" ]; then
    analyseClass $JAR_PATH
else
    for entr in $(jar -tf $1) ; do # process all entries of a jar (*.class, ...)
        if [ "${entr:(-6)}" == ".class" ]; then
            CLASS=${entr//\//.}                  # convert a/b/c.class -> a.b.c.class
            analyseClass " -classpath ${JAR_PATH} ${CLASS:0:-6}" # remove ".class"
        fi
    done
fi
