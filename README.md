# CryptoHack Docker Container

A Jupyter notebook environment built for attacking crypto CTF challenges, with custom theming matching [CryptoHack](https://cryptohack.org).

It comes with the following installed and integrated:
 - Sage 10 (based on Python3)
 - Pwntools
 - PyCryptodome
 - z3 Prover

## Installation

### Build

```bash
cd cryptohack-docker
docker build . -t cryptohack
```

### Run

Open terminal in root folder CTF

```bash
docker run --name CTF-Crypto --restart always -p 8888:8888 -v .:/home/sage/ctf-challenges -it cryptohack
```

![Alt text](image.png)

![Alt text](image-1.png)

## VS Code

![Alt text](image-2.png)

![Alt text](image-3.png)

![Alt text](image-4.png)

![Alt text](image-5.png)

![Alt text](image-6.png)

~/sage/local/var/lib/sage/venv-python3.11.1/bin/python3.11
![Alt text](image-7.png)

## Bad
- Can't use with libs using image, screenshot like pyzbar, PIL,...
 
Refer:
- https://github.com/cryptohack/cryptohack-docker
- https://github.com/vishiswoz/cryptohack-docker
