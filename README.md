# Requirements

 * A TeX distribution
 * GNU `make`
 * `epstopdf`

# Typesetting

Typeset the thesis as follows:

```bash
git clone https://github.com/Witiko/fithesis3-bt.git 
cd fithesis3-bt
git clone https://github.com/Witiko/fithesis3.git --branch future --single-branch
cd fithesis3
mv fithesis3/* .
make all
cd ..
make all
```
