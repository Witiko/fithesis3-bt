#!/bin/sh
typeset() {
  sed -i 's/{[0123456789]*%??page??/{'$2'%??page??/' guide.dtx
  make $1.pdf
}

make -C resources
typeset fi 33
typeset sci 53
typeset econ 73
typeset fss 91
typeset law 111
typeset med 131
typeset ped 147
typeset phil 167
typeset fsps 187
make clean
