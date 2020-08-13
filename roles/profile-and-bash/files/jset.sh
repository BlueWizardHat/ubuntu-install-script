#!/usr/bin/env bash

j_version="$1"
option="$2"

function print_vendors() {
	echo "   To search for a specific JDK vendor use one of the following options:"
	echo "      OpenJDK:   -open, -openjdk"
	echo "      Adoptium:  -adopt, -adoptium, -adoptopenjdk, -hotspot, -j9"
	echo "      Oracle     -oracle"
}

if [ -z "$j_version" ]; then
	echo "No version given"
	echo "Usage: jset <java-version> [<vendoroption>]"
	print_vendors
	return 1
fi

function remove_path() {
	if [ ! -z "$1" ]; then
		export PATH=`echo $PATH | sed "s|$1:||"`
	fi
}

# $1 - New path of JAVA_HOME
function set_java_home() {
	NEW_JAVA_HOME=$1

	if [ ! -z "$NEW_JAVA_HOME" ]; then
		if [ ! -z "$JAVA_HOME" ]; then
			remove_path "$JAVA_HOME/bin"
		fi
		export JAVA_HOME="$NEW_JAVA_HOME"
		export PATH="$JAVA_HOME/bin:$PATH"
	fi
}

JDK_BASE_PATH="/opt/java/jdks"
SEARCH_PATHS="$JDK_BASE_PATH/adoptium $JDK_BASE_PATH/openjdk $JDK_BASE_PATH/adoptium-j9 $JDK_BASE_PATH/oracle"
if [ ! -z "$option" ]; then
	if [[ "$option" =~ ^-open(jdk)?$ ]]; then
		SEARCH_PATHS="$JDK_BASE_PATH/openjdk"
	elif [[ "$option" =~ ^-(adopt(ium|open(jdk)?)?|hotspot)$ ]]; then
		SEARCH_PATHS="$JDK_BASE_PATH/adoptium"
	elif [ "$option" == "-j9" ]; then
		SEARCH_PATHS="$JDK_BASE_PATH/adoptium-j9"
	elif [ "$option" == "-oracle" ]; then
		SEARCH_PATHS="$JDK_BASE_PATH/oracle"
	else
		echo "Unknown option: $option"
		print_vendors
		return 1
	fi
	# echo "Searching $SEARCH_PATHS"
fi

new_j_home=""
for path in $SEARCH_PATHS; do
	#echo "Searching in $path"
	for i in $path/*; do
		if [[  ${i##*/} =~ jdk-?$j_version ]]; then
			#echo "found ${i}"
			new_j_home="$i"
		fi
	done
	if [ ! -z "$new_j_home" ]; then
		break
	fi
done

if [ ! -z "$new_j_home" ]; then
	resolved=$(readlink -f $new_j_home)
	if [ "$resolved" == "$new_j_home" ]; then
		echo "Setting JAVA_HOME=$resolved"
	else
		echo "Setting JAVA_HOME=$resolved (${new_j_home##*/})"
	fi
	set_java_home "$resolved"
else
	echo "No matching jdk found in $SEARCH_PATHS"
	return 1
fi
