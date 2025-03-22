# bx
## Binary exponentiation $\mod  2^{64}$


## Installation
Download `yasm` in case it is not already installed. Makefile provides build instructions.
```
sudo apt-get update && \
sudo apt-get install -y yasm && \
make
```

Remove remaining object files with `make clean`.

## Usage
```
bx <BASE> <EXPONENT>
```
Result is written to `stdout`.
