# Requirements

 * A TeX distribution
 * GNU `make`
 * `epstopdf`

# Typesetting

Typeset the thesis as follows:

```bash
git clone https://github.com/Witiko/fithesis3-bt.git --branch svoc --single-branch
cd fithesis3-bt
git clone https://github.com/Witiko/fithesis3.git
cd fithesis3
git checkout v0.3.11-alpha
make -C fithesis3
make -C ..
```
