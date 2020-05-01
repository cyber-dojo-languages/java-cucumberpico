
CLASSES=.:`ls /cucumber/*.jar | tr '\n' ':'`
javac --enable-preview --release 14 -Xlint:unchecked -cp $CLASSES  *.java
if [ $? -eq 0 ]; then
  # run test classes even if they are inner classes
  java --enable-preview -cp $CLASSES org.junit.runner.JUnitCore \
    `ls -1 *Test*.class | grep -v '\\$' | sed 's/\(.*\)\..*/\1/'`
fi
