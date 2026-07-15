# My Storm Blackice

Las FPGAs de código abierto son comúnmente usadas en **Linux**, así que esta guía está solo enfocada en Linux; en caso de tener Windows, instalar Linux o se puede usar una función conocida como WSL (Windows Subsystem Linux) que permite correr Linux en una especie de máquina virtual en Windows. Para esto se recomienda que generalmente se use la distribución de Ubuntu, que es la mejor implementada para esto; si tiene que usar esto, acá está la opción para instalarlo: [instalar WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

Links importantes de acceso rapido:

- [Salidas Pmod](#pin-out)
- [Creacion de Proyecto](#creacion-de-proyecto)
- [Constrains](/FPGAS/My%20Storm%20Blackice/src/top.pcf)

## Pin Out

La Blackice es una FPGA compacta que tiene muchas funciones y herramientas; a continuación está el pin planner de la tarjeta.

![pinout](/FPGAS/My%20Storm%20Blackice/img/pinout.png)

La Blackice cuenta con 2 botones incorporados en los pines 49 y 52, además de contar con 4 LEDs en los pines 49, 52 y 56.

## Herramientas de la Blackice

Como mencioné, todo esto está enfocado para usarlo en Linux, así que vamos a necesitar usar bastante la terminal para instalar diversos paquetes para su funcionamiento.

Lo primero es instalar las herramientas básicas que se necesitan para el trabajo con esta FPGA.

- Linux Mint/Ubuntu

```bash
sudo apt update
sudo apt install eog picocom imagemagick curl wget default-jdk git pulseview sigrok-firmware-fx2lafw ngspice gcc build-essential -y
```

- Arch Linux

```bash
    sudo pacman -Syu base-devel eog picocom imagemagick curl wget jdk-openjdk git pulseview sigrok-firmware-fx2lafw ngspice
```

Miniconda para manejar las dependencias de código abierto que necesita la FPGA

- En Linux Mint/Arch Linux/Ubuntu

```bash
cd && cd Descargas || cd Downloads
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh # Seguir las instrucciones y reiniciar la terminal
```

y por último los paquetes para programar la FPGA:

```bash
curl https://raw.githubusercontent.com/johnnycubides/digital-electronic-1-101/main/installTools/spec-file.txt > ./spec-file.txt && conda create -n digital --file ./spec-file.txt && echo "conda activate digital" >> ~/.bashrc
```

## Creación de proyecto

Ahora vamos a crear un proyecto base donde iremos trabajando todos los archivos que necesitamos a la hora de trabajar. Con esto podemos ir modificándolo y solo simular lo que necesitamos. Lo primero es abrir la terminal y ejecutar el siguiente comando:

```bash
conda activate digital
```

Después vamos a abrir el editor de código visual o el que tengan

```bash
code & # Si usan otro editor, lo abren con el que usen
```

Una vez ya esté en el editor, vamos a abrir un proyecto blink que permite tanto sintetizar como compilar la información mediante la misma terminal. Para esto vamos a **descargar** el siguiente [archivo](/FPGAS/My%20Storm%20Blackice/src/blink.zip) y subirlo al editor.

Una vez ya esté cargado, ejecutamos este comando:

```bash
make
```

Esto debería mostrar una barra de esta forma:

![blink](/FPGAS/My%20Storm%20Blackice/img/blink.png)

Con esto ya tenemos un espacio donde trabajar. Ahora siempre para usar la FPGA deben seguir estos pasos para subir el código que se encuentra:

1. **Sintesis**

```bash
make syn
```

Esto genera un bitstream que el dispositivo puede cargar.

2. **Configuracion**

```bash
make config
```

Con esto debería prenderse un led rojo en la FPGA. Tener en cuenta que para este código se está usando un archivo .pcf (pin constrains file) con el cual usamos los puertos de la FPGA, ese lo encuentran acá: [Constrains](/FPGAS/My%20Storm%20Blackice/src/top.pcf). Al final le quitamos los dos comentarios a los LEDs que queremos usar y a la frecuencia con la que trabajamos, que es la de las FPGA.

*línea 161* ```set_io red_led 56 # Usamos el led rojo```

*línea 164* ``set_io clk 60 # Este no está comentado``

Con esto definimos qué pines son los que usamos y asignamos en el top.v. Cuando quieran usar otro lo ponen en el top y **le quitan el comentario** (solo con borrar el "#" cuenta)
