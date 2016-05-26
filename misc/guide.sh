#!/bin/sh
typeset() {
  sed -i 's/{[0123456789]*%??page??/{'$2'%??page??/' guide.dtx
  make $1.pdf
}

make -C resources
typeset fi 33
typeset sci 55
typeset econ 77
typeset fss 95
typeset law 117
typeset med 139
typeset ped 157
typeset phil 179
typeset fsps 199
make clean
