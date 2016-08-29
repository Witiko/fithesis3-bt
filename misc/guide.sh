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
typeset law 115
typeset med 135
typeset ped 153
typeset phil 173
typeset fsps 193
make clean
