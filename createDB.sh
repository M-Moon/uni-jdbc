#!/bin/bash

javac *.java
java -cp "sqlite-jdbc-3.7.2.jar:." Coursework $1 > $2
