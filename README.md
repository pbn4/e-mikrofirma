# Instrukcja

Instalację dockera pozostawiam użytkownikowi. 

Tworzymy katalog w którym `e-mikrofirma` przetrzymywać będzie swoje pliki:

```sh
$ mkdir $HOME/AKMF
```

Uruchamiamy kontener:
```sh
$ docker run -ti --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/AKMF:/home/user/AKMF \
    michalp1/e-mikrofirma
```
