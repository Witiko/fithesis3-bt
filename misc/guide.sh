#!/bin/sh
typeset() {
  sed -i 's/{[0123456789]*%??page??/{'$2'%??page??/' guide.dtx
  make $1.pdf
}

make -C resources
typeset fi 33
typeset sci 53
typeset econ 75
typeset fss 93
typeset law 113
typeset med 133
typeset ped 151
typeset phil 171
typeset fsps 191
make clean
