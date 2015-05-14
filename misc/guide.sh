#!/bin/sh
typeset() {
  sed -i 's/{[0123456789]*%??page??/{'$2'%??page??/' guide.tex
  make $1.pdf
}

make -C examples
typeset fi 33
typeset sci 49
typeset econ 65
typeset fss 81
typeset law 97
typeset med 113
typeset ped 129
typeset phil 145
typeset fsps 161
make clean
