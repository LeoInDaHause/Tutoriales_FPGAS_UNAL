# Tutoriales FPGA's

El objetivo de este repositorio es mostrar una manera simplificada y entendible para utilizar las FPGAs disponibles en el laboratorio de la Universidad Nacional de Colombia. En este repositorio por el momento se van a revisar las FPGAs que he usado en mis proyectos debido a que son las más familiares, en dado caso se pueden agregar otras más a futuro.

Si ven algun error o necesitan alguna información adicional pueden hacer un pull request o abrir un issue. En dado caso que quieran comunicarse mi información es:

- Correo: [crodriguezle@unal.edu.co](mailto:crodriguezle@unal.edu.co)

Listado de las FPGA's que se encuentran en la guia:

> - [*Digilent Zybo z7*](FPGA'S/Zybo%20Z7/Zyboz7.md) (Propietario: AMD)
> - [*BlackIce MyStorm*](FPGA'S/BlackIce/BlackIce.md) (Software Libre)
> - [*Altera Cyclone*](FPGA'S/CycloneIV.md/CycloneIV.md) (Propietario: Intel, en progreso por el momento)

Hecho por: Cesar Rodriguez - Estudiante de Ingeniería Electrónica de la Universidad Nacional de Colombia.

## Herramientas Básicas

Antes de empezar a utilizar cualquier FPGA es importante tener en cuenta las herramientas con las que se va a trabajar. Dependiendo de la FPGA se van a necesitar unas u otras, pero en esta parte se van a mostrar las básicas que se necesitan sí o sí en cualquier ambiente de trabajo. Hay que tener en cuenta que también dependiendo del OS (Sistema Operativo) tienen ciertas formas de instalarse.

### 1. Sistema Operativo

La primero es conocer donde se quiere trabajar. Existen muchos sistemas operativos pero los mas usados son Windows, Linux y MacOS. En mi experiencia solo he trabadajo con Linux y Windows, asi que con esos va a partir la guia. Si usan MacOs pueden intentar instalar linux pero se vana tirar el pc.

Aqui les dego una guia para instalar tanto linux o Windows en dado caso que hayan desisntalado windos (me paso).

> [*Instalacion sistema operativo*](OS/os.md)

### 2. Entorno de Desarrollo (IDE)

Para progamar las FPGS es como desarollar codigo, por lo cual es recomendable tener una aplicacion capaz de editar, compilar y ejectuar  el codigo, aparte de usar la terminal. En mi recoemndacion el mas util es **Visual Studio Code** o en abreviacion **VS Code**, un editor gratuito y bastante comodo para usar y personalizar. Al inicio puede ser un poco abrumador pero con el tiempo se vuelve bastante util.

Tener en cuenta el sistema operativo que se usa e instalarlo:

- Linux (*Cuidado con la distribucion o descargar el .tar equivalente al zip en windows*)

> [*Instalacion VS Code Linux*](https://code.visualstudio.com/docs/setup/linux)

- Windows

> [*Instalacion VS Code Windows*](https://code.visualstudio.com/docs/setup/windows)

Pagina oficial para descargar Visual Studio Code: <https://code.visualstudio.com/download>

Hay otros entornos de desarollo, si ya usaban otro no se preocupen pueden usarlo siempre y cuando sepan como y les sea comodo.

### 3. Lenguaje de Programacion (HDL)

Para progarmar una FPGA se necesita de un leguaje descriptivo de hardware conocido como HDL (Hardware Description Language), los dos mas usados son **Verilog** y **VHDL**, ambos muy similares en su sintaxis pero si tienen sus diferencias. El que se maneja en esta guia es Verilog, ya que es con el que estoy mas familiarizado.

Ahora teniendo en cuenta que vamos a usar Verilog, bnecesitamos de un compilador que entienda las isntrucciones que hace este lenguaje y las pase a un formato que la maquina en este caso FPGA pueda operar. Tambien existen varios pero vamos a usar **Icarus Verilog** por misams razone anteriores.

Por comodidad vamosa  instalar todo desde el terminal, asi evitamos depender de las versiones y dejar en la instalaciona automatica de los archivos.

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

#### Verificar la Instalación  Icarus (*Indempendiente de windows o linux*)

Para revisar que se haya instalado correctamente, se puede ejecutar el siguiente comando en la terminal de linux o en cmd de windows:

```bash
iverilog -v
```

Esto muestra la versión de Icarus Verilog instalada como: `Icarus Verilog version XX.X` (o similar). En dado caso que no funcione, está el repositorio donde se puede descargar manualmente: <https://sourceforge.net/projects/iverilog/>.

### Entorno de Simulacion (GTKWave)

Al utilizar un HDL como verilog, es importante tener una herramienta que permita ver como el codigo se comporta. GTKWave es una herramienta para visualizar esto, mediante pulsos de tiempo y señales. Con esto se comprende si el codigo funcia de la manera esperada. Esto se hace con el objetivo de al implemtera en una FPGA, no haya errores que puedan causar que el dispositivo se dane (generalmente no pasa pero por si acaso).

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

#### Verificar la Instalación GTKWave (*Indempendiente de windows o linux*)

Tambien podemos verirficar si esta instalado usando el comando para ver la version:

```bash
gtkwave --version
```

Aparece algo como `GTKWave Analyzer vX.X.XXXX (w)1999-20XX BSI`, endado caso que no este, descargarlo directamente de la pagina: <https://gtkwave.sourceforge.net/>.

*las XXX son numeros que dependen de la version isntalada, no tienen que tener especificamente XXX, es solo un ejemplo.*

#### Seleccion de Hardware (FPGA)

Con esto ya estaria todas las herramientas basicas de trabajo, aun asi esto no significa que deban de intalar mas cosas para manipular las fpgas.

Dependeindo del dispositivo, este va a pedir ciertas erramientas especificas no solo para la deteccion de este si no del dispositivo en si. Aparte como cada uno de las FPGA'S tiene una empresa propietara estas se encargan de desarollar un sistema capaz de compilar lo que deseen. Revinz que tipo de dispositivo estan usando y seleccionel la guia correspondiente.

> - [*Digilent Zybo z7*](FPGA'S/Zybo%20Z7/Zyboz7.md) (Propietario: AMD)
> - [*BlackIce MyStorm*](FPGA'S/BlackIce/BlackIce.md) (Software Libre)
> - [*Altera Cyclone*](FPGA'S/CycloneIV.md/CycloneIV.md) (Propietario: Intel, en progreso por el momento)
