# Tutoriales FPGA's

El objetivo de este repositorio es mostrar una manera simplificada y entendible para utilizar las FPGAs disponibles en el laboratorio de la Universidad Nacional de Colombia. En este repositorio por el momento se van a revisar las FPGAs que he usado en mis proyectos debido a que son las más familiares, en dado caso se pueden agregar otras más a futuro.

Si ven algún error o necesitan alguna información adicional pueden hacer un pull request o abrir un issue. En dado caso que quieran comunicarse, mi información es:

- Correo: [crodriguezle@unal.edu.co](mailto:crodriguezle@unal.edu.co)

Listado de las FPGA's que se encuentran en la guía:

> - [*Digilent Zybo z7*](FPGA'S/Zybo%20Z7/Zyboz7.md) (Propietario: AMD)
> - [*Altera Cyclone*](FPGA'S/CycloneIV.md/CycloneIV.md) (Propietario: Intel, en progreso)
> - [*BlackIce MyStorm*](FPGA'S/BlackIce/BlackIce.md) (Software Libre)
> - [*Color Ligth*](FPGA'S/ColorLigth/ColorLigth.md) (Software Libre, en progreso)

Hecho por: Cesar Rodriguez - Estudiante de Ingeniería Electrónica de la Universidad Nacional de Colombia.

## Herramientas Básicas

Antes de empezar a utilizar cualquier FPGA es importante tener en cuenta las herramientas con las que se va a trabajar. Dependiendo de la FPGA se van a necesitar unas u otras, pero en esta parte se van a mostrar las básicas que se necesitan sí o sí en cualquier ambiente de trabajo. Hay que tener en cuenta que también dependiendo del OS (Sistema Operativo) tienen ciertas formas de instalarse.

### 1. Sistema Operativo

Lo primero es conocer dónde se quiere trabajar. Existen muchos sistemas operativos pero los más usados son Windows, Linux y MacOS. En mi experiencia solo he trabajado con Linux y Windows, así que con esos va a partir la guía. Si usan MacOS pueden intentar instalar Linux pero se van a tirar el PC.

Aquí les dejo una guía para instalar tanto Linux o Windows en dado caso que hayan desinstalado Windows (me pasó).

> [*Instalación sistema operativo*](OS/os.md)

### 2. Entorno de Desarrollo (IDE)

Para programar las FPGAs es como desarrollar código, por lo cual es recomendable tener una aplicación capaz de editar, compilar y ejecutar el código, aparte de usar la terminal. En mi recomendación el más útil es **Visual Studio Code** o en abreviación **VS Code**, un editor gratuito y bastante cómodo para usar y personalizar. Al inicio puede ser un poco abrumador pero con el tiempo se vuelve bastante útil. **Pagina oficial de Visual Studio Code: <https://code.visualstudio.com/>.**

Tener en cuenta el sistema operativo que se usa e instalarlo:

- Linux (*Cuidado con la distribución o descargar el .tar equivalente al zip en Windows*)

> [*Instalación VS Code Linux*](https://code.visualstudio.com/docs/setup/linux)

- Windows

> [*Instalación VS Code Windows*](https://code.visualstudio.com/docs/setup/windows)

Hay otros entornos de desarrollo, si ya usaban otro no se preocupen pueden usarlo siempre y cuando sepan cómo y les sea cómodo.

### 3. Lenguaje de Programación (HDL)

Para programar una FPGA se necesita de un lenguaje descriptivo de hardware conocido como HDL (Hardware Description Language), los dos más usados son **Verilog** y **VHDL**, ambos muy similares en su sintaxis pero sí tienen sus diferencias. El que se maneja en esta guía es Verilog, ya que es con el que estoy más familiarizado.

Ahora teniendo en cuenta que vamos a usar Verilog, necesitamos de un compilador que entienda las instrucciones que hace este lenguaje y las pase a un formato que la máquina, en este caso FPGA, pueda operar. También existen varios pero vamos a usar **Icarus Verilog** por las mismas razones anteriores.

Por comodidad vamos a instalar todo desde la terminal, así evitamos depender de las versiones y dejar en la instalación automática de los archivos. **Pagina oficial de Icarus Verilog: <https://steveicarus.github.io/iverilog/>.**

#### Linux (Icarus Verilog)

Dependiendo de la distribución, se puede instalar Icarus Verilog abriendo la terminal del sistema y ejecutando lo siguiente:

- Linux Mint / Ubuntu / Debian

```bash
sudo apt install iverilog
```

- Arch Linux

```bash
sudo pacman -S icarus-verilog
```

#### Windows (Icarus Verilog)

Windows tiene un sistema de manejo de paquetes bastante interesante llamado **Winget** que permite instalar aplicaciones desde la terminal. Se puede abrir desde el menú de inicio o con la combinación de teclas `Win + R` y escribiendo `cmd` para abrir la terminal, luego se ejecuta lo siguiente:

```bash
winget install Icarus.Verilog
```

#### Verificar la Instalación  Icarus (*Independiente de Windows o Linux*)

Para revisar que se haya instalado correctamente, se puede ejecutar el siguiente comando en la terminal de Linux o en cmd de Windows:

```bash
iverilog -v
```

Esto muestra la versión de Icarus Verilog instalada como: `Icarus Verilog version XX.X` (o similar). En dado caso que no funcione, está el repositorio donde se puede descargar manualmente: <https://github.com/steveicarus/iverilog/releases>.

### Entorno de Simulación (GTKWave)

Al utilizar un HDL como Verilog, es importante tener una herramienta que permita ver cómo el código se comporta. GTKWave es una herramienta para visualizar esto, mediante pulsos de tiempo y señales. Con esto se comprende si el código funciona de la manera esperada. Esto se hace con el objetivo de al implementarlo en una FPGA, no haya errores que puedan causar que el dispositivo se dañe (generalmente no pasa pero por si acaso). **Pagina oficial de GTKWave: <https://gtkwave.github.io/gtkwave/>.**

#### Linux (GTKWave)

Abrir la terminal y usar el comando correcto dependiendo de la distribución:

- Linux Mint / Ubuntu / Debian

```bash
sudo apt install gtkwave
```

- Arch Linux

```bash
sudo pacman -S gtkwave
```

#### Windows (GTKWave)

Abriendo la terminal con los comandos `Win + R` y escribiendo `cmd`, luego se ejecuta lo siguiente en la terminal:

```bash
winget install gtkwave
```

#### Verificar la Instalación GTKWave (*Independiente de Windows o Linux*)

También podemos verificar si está instalado usando el comando para ver la versión:

```bash
gtkwave --version
```

Aparece algo como `GTKWave Analyzer vX.X.XXXX (w)1999-20XX BSI`, en dado caso que no esté, descargarlo directamente de la página: <https://github.com/gtkwave/gtkwave/releases>.

*Nota: las XXX son números que dependen de la versión instalada, no tienen que tener específicamente XXX, es solo un ejemplo.*

### Selección de Hardware (FPGA)

Con esto ya estarían todas las herramientas básicas de trabajo, aún así esto no significa que deban de instalar más cosas para manipular las FPGAs.

Dependiendo del dispositivo, este va a pedir ciertas herramientas específicas no solo para la detección de este, sino del trabajo del dispositivo en sí. Aparte como cada uno de las FPGA'S tiene una empresa propietaria, estas se encargan de desarrollar un sistema capaz de compilar lo que deseen. Revisen qué tipo de dispositivo están usando y seleccionen la guía correspondiente.

> - [*Digilent Zybo z7*](FPGA'S/Zybo%20Z7/Zyboz7.md) (Propietario: AMD)
> - [*Altera Cyclone*](FPGA'S/CycloneIV.md/CycloneIV.md) (Propietario: Intel, en progreso)
> - [*BlackIce MyStorm*](FPGA'S/BlackIce/BlackIce.md) (Software Libre)
> - [*Color Ligth*](FPGA'S/ColorLigth/ColorLigth.md) (Software Libre, en progreso)
