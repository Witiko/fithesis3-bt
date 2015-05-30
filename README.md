# Requirements

 * A TeX distribution
 * GNU `make`
 * `epstopdf`

# Typesetting

Typeset the thesis as follows:

```bash
git clone https://github.com/Witiko/fithesis3-bt.git --branch muni --single-branch
cd fithesis3-bt
curl https://codeload.github.com/Witiko/fithesis3/tar.gz/v0.3.11-alpha | tar xz
mv fithesis3-0.3.11-alpha fithesis3
make -C fithesis3/fithesis3
make
```
