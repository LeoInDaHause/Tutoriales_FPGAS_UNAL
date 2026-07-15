# Tutoriales FPGA's

Con el objetivo de hacer una experiencia sencilla del uso de las FPGAs se realizó esta guía. Una forma detallada y simple para el uso de las herramientas que se encuentran en el laboratorio de la Universidad Nacional de Colombia. En esta guía se va a encontrar el paso a paso con las referencias de todos los enlaces para que estén a la mano y puedan consultarse en cualquier momento.

De momento esta es una lista de las FPGA que se encuentran en la guia:

> - *Zybo Z7* (Propietario: Digilent)
> - *Cyclone IV* (Propietario: Altera) (en progreso, no está todavía)
> - *MyStorm BlackIce* (Open Source)
> - *Color Ligth* (Open Source, **en progreso**)

En dado caso de que tengan la opción de escoger con cuál herramienta trabajar, más adelante explicaré con detalle cuáles pueden ser algunos de los problemas y ventajas que cada una puede tener.

Por otro lado, si hay algún error o algo que no funcione, pueden agregar un pull request en el repositorio o contactarme directamente al correo.

- **Hecho por:** Cesar Rodriguez - [crodriguezle@unal.edu.co](mailto:crodriguezle@unal.edu.co)
- **Materia:** Digital I
- **Profesor:** Andres Gallego Junior

## Herramientas

Antes de usar una FPGA toca tener en cuenta varios factores para usarlas. Si bien todas pueden utilizar el mismo lenguaje y estructuras, cada una tiene sus particularidades, aparte de tener en cuenta qué sistema operativo se va a usar. Para eso están estos pasos a tener en cuenta:

1. [Sistema Operativo](#sistema-operativo)
2. [Herramientas básicas](#herramientas-básicas)
3. [Pruebas de instalación](#pruebas-de-instalación)
4. [Seleccion de hardware (FPGA)](#selección-de-hardware)
5. [Herramientas específicas](#herramientas-específicas)

Con esto se cubre lo esencial para el manejo de cada una. Dependiendo de los proyectos y trabajos que se decidan hacer, se va a necesitar una que otra herramienta adicional, pero eso son detalles que se exploran después de saber usar la FPGA.

## Sistema Operativo

Antes de comenzar instalando cualquier aplicación, toca saber en qué espacio se quiere trabajar. Si bien las FPGAs usan un lenguaje de programación conocido como HDL (Hardware Description Language), como cualquier lenguaje se puede manejar tanto en Linux, Mac o Windows. El problema radica en que, dependiendo de la FPGA, puede ser más fácil instalar las aplicaciones adicionales en ciertos sistemas operativos.

Mi recomendación es instalar todo en **Linux**, es donde se tiene mejor control de las FPGAs, no se necesitan tantos drivers (como en Windows) y generalmente el rendimiento de las aplicaciones pesadas es mejor en Linux. Igual reitero: si quieren manejarlo en Windows se puede, solo que puede dar problemas diferentes a los encontrados en Linux.

- **Linux:** Recomendado para comenzar
- **Windows 10/11:** un poco más complicado pero se puede usar
- **Mac:** No lo recomiendo

*PD: si usan Mac tienen dos opciones: 1. Buscar a alguien que tenga un computador con Linux/Windows o 2. usar VM (virtual machine) **LO CUAL NO RECOMIENDO** dado que las máquinas virtuales dan demasiados errores y pueden ni reconocer el hardware*

Con lo anterior en cuenta, vamos a explicar un poco a detalle cómo instalar Linux. Si van a usar Windows se pueden saltar esta sección hasta la instalación de [herramientas basicas](#herramientas-básicas).

### Instalación Linux

Como contexto, Linux es un sistema operativo de bajo consumo enfocado en ser ligero y rápido, desarrollado por Linus Torvalds en su época de la universidad. **¿Por qué usar Linux?** Aparte de que es ventajoso, actualmente es el sistema operativo que se usa en servidores y sistemas de control.

A diferencia de Windows, Linux tiene muchas distribuciones. Estas son personalizaciones que desarrolla la gente debido a ser un sistema operativo de código abierto. Existen muchas y muchas son muy buenas ([lista de distribuciones](https://en.wikipedia.org/wiki/List_of_Linux_distributions)), pero acá les voy a dar mi recomendación de las más usadas y cómodas.

1. **Linux Mint**: Es la mejor para empezar a usar Linux, muy cómoda, se parece a Windows en su forma y te permite usar los paquetes que se usan en Ubuntu. **[Página oficial Linux Mint](https://linuxmint.com/)**

2. **Ubuntu**: Es un poco más complicado, recomendado si ya saben usar la terminal de Bash, pero en mi opinión es más bonita la interfaz gráfica de Mint. **[Página oficial Ubuntu](https://linuxmint.com/)**

3. **Arch Linux**: Ya para expertos, corre hasta en una patata. Sí o sí toca haber usado Linux antes y estar familiarizado con los comandos. Es muy complicado de usar, pero eso compensa su velocidad y ligereza. Es mi distribución favorita por lo personalizable que es, pero si no se tiene cuidado al instalar puede "dañar" el computador (me pasó). **[Página oficial Arch Linux](https://archlinux.org/)**

Lo siguiente a tener en cuenta es cómo se va a instalar. Hay tres formas de realizar la instalación de Linux: dual boot, disco externo y disco principal.

#### Dual boot

    Es una forma de tener dos sistemas operativos al tiempo, se usa generalmente para evitar desinstalar Windows y, mediante una ventana, escoger el sistema operativo. Es lo más común que se usa a la hora de instalar en un mismo disco.

#### Disco externo

    Se instala Linux en un disco externo. De pronto tienen que modificar un poco la BIOS para decirle cuándo tienen que iniciar desde el disco principal o externo.

#### Disco principal

    Deja a Linux como el sistema operativo principal. Algunos computadores lo traen, pero es muy raro verlo así.

Les recomiendo usar dual boot en caso de que el computador que usen sea Windows.

**IMPORTANTE!!:** Dependiendo de la FPGA que usen, tienen que dejar al menos **200 GB** de espacio si usan la Zybo Z7 o **100 GB** para la Cyclone IV, debido a lo pesado que pueden ser los programas que se usan en la FPGA. En otro caso, dejen **75 GB**. Deben tener una **memoria USB de 8 GB** para guardar las ISO de Linux y poder instalarlo.

<!-- markdownlint-disable MD060 -->
| Distribución | Instalación oficial | Dual boot | External drive |
|--------------|---------------------|-----------|----------------|
| Linux Mint   | [Guia](https://linuxmint-installation-guide.readthedocs.io/en/latest/) | [Video](https://youtu.be/0gSr8YsJtd0?si=Z4UZrcyQEacz3PeO) | [Video](https://youtu.be/WVcYN2q22g8?si=qp4abdvrB87x1RPY) |
| Ubuntu       | [Guia](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview) | [Video](https://www.youtube.com/watch?v=UTqDuWHbZkw&pp=ygUQZHVhbCBib290IHVidW50dQ%3D%3D) | [Video](https://youtu.be/0Ol8hYXX-xc?si=prBx7QFNoYWYZQd1) |
| Arch Linux   | [Guia](https://wiki.archlinux.org/title/Installation_guide) | [Video](https://youtu.be/BB_SnWBQ6xw?si=7mLKM0LxmiBM_UuF) | [Video](https://youtu.be/yYyh3PrIB7w?si=CkD1cQh-Wu42nglH) |
<!-- markdownlint-enable MD060 -->

## Herramientas Básicas

Hay unas herramientas básicas que sí o sí necesitan antes de trabajar con una FPGA. Estas permiten reconocer el lenguaje de programación que se usa, como tener una primera simulación de lo que se está haciendo. Para esto se va a tener en cuenta: el **entorno de trabajo (IDE)**, **compilador de HDL** y **entorno de simulación**.

### Entorno de trabajo

Lo primero es tener un espacio en el cual sea cómodo y fácil de programar. Así como en las distribuciones de Linux hay muchas aplicaciones que se pueden usar. Mi recomendación es Visual Studio Code (VS Code) o también pueden usar alguna que prefieran o hayan usado antes.

- [Instalar VS code linux](https://code.visualstudio.com/docs/setup/linux)
- [Instalar VS code windows](https://code.visualstudio.com/docs/setup/windows)
- [Descargar VS code](https://code.visualstudio.com/download)

### Compilador de HDL

El lenguaje de programación que usan las FPGAs es un poco diferente al comúnmente usado. Como su nombre lo indica, a este lenguaje se le conoce como hardware description language y lo que uno hace es describir funcionamientos del hardware con procesos de clock y ondas para realizar funciones. Aquí se ajusta dependiendo de pulsos las acciones que se requieren realizar.

Hay dos principales HDL: está Verilog (el que se va a trabajar) o VHDL. Todo va a estar enfocado a usar Verilog, pero así mismo se puede trabajar con VHDL, aunque comúnmente es más usado Verilog.

<!-- markdownlint-disable MD046 -->

> Instalación en Linux Mint/Ubuntu

```bash
sudo apt update # Actualizar paquetes
sudo apt install -y iverilog # Instalar compilador de Verilog
iverilog -V # Revisar la versión
```

> Instalación en Arch Linux

```bash
sudo pacman -Syu # Actualizar paquetes
sudo pacman -S iverilog # Instalar compilador de Verilog
iverilog -V # Revisar la versión
```

> Instalación en Windows (con winget)

```powershell
winget install Icarus.Verilog  # Instalar compilador de Verilog
iverilog -V  # Revisar la versión
```

<!-- markdownlint-enable MD046 -->

La opción de Windows es mediante la terminal o siempre pueden [descargar](https://sourceforge.net/projects/gtkwave/files/gtkwave-3.3.100-bin-win64/) el .exe y ejecutar el archivo aceptando GTKWave.

### Entorno de simulación

Para probar el HDL toca usar otra herramienta llamada GTKWave, la cual hace posible ver el comportamiento mediante la simulación de pulsos de onda cuadrados (1 arriba y 0 abajo). Esto permite observar errores antes de llegar a la implementación en la FPGA, que en algunos casos extremos puede llegar a dañar el dispositivo.

<!-- markdownlint-disable MD046 -->

> Instalar paquete en Linux Mint/Ubuntu

```bash
sudo apt install -y gtkwave
```

> Instalar paquete en Arch Linux

```bash
sudo pacman -S gtkwave
```

> Instalar paquete en Windows

    Ya se instaló con GTKWave.

<!-- markdownlint-enable MD046 -->

## Pruebas de instalación

Para confirmar que todo se instaló vamos a probar todas las herramientas. Lo primero es ir a Visual Studio Code y abrirlo. En la esquina superior derecha hay una opción que dice File; vamos a hacer File -> Open Folder, creamos una carpeta donde queremos trabajar y seleccionamos esa carpeta.

![Creación carpeta](/img/folder.png)

Después vamos a descargar los archivos: [test_inst.v](/src/test_inst.v) y [tb_test_inst.v](/src/tb_test_inst.v) y los agregamos a la carpeta. Una vez los archivos se encuentren, se abre la terminal dándole arriba a Terminal -> New Terminal.

![Abrir terminal](/img/terminal.png)

A continuación, en la terminal vamos a ejecutar estos comandos para compilar y simular los archivos.

<!-- markdownlint-disable MD046 -->
```bash
iverilog -o sim_test tb_test_inst.v # Compilar el código
```

```bash
vvp sim_test # Simular
```

```bash
gtkwave wave.vcd # Ver simulación en GTKWave
```
<!-- markdownlint-enable MD046 -->
Al ejecutar estos comandos se debería abrir una ventana de esta forma, confirmando que sí están todas las herramientas:

![gtkwave](/img/gtkwave.png)

Si le damos clic a tb_test_inst aparecen las entradas y salidas del programa: *a*, *b*, *o_and*, *o_or* y *sum*. Al darle doble clic a cada una encima van a cargar las ondas de la simulación de la siguiente forma:

![ondas](/img/wave.png)

Si aparece de esa forma confirmamos que todo se instaló correctamente y podemos pasar a usar el hardware.

## Selección de hardware

De FPGAs hay muchas, pero acá solo se van a encontrar las que están disponibles en el laboratorio, con prioridad de las que he manejado.

- **Zybo Z7**: Tarjeta muy completa, tiene varios Pmod (Peripheral Module). Tiene integrados 4 switches, 4 botones, 4 LEDs y un RGB. Lo molesto es que el programa para usarlo pesa aprox. 100 GB, así que toca tener el espacio necesario, pero es bastante cómoda de usar.

- **Cyclone IV**: Tiene diferentes versiones, pero algunas tienen switches integrados, con display de 7 segmentos para utilizar. Buena cantidad de Pmod y se programa con Quartus, que necesita al menos 40 GB para la suite completa; se puede instalar la Lite, pero a veces da errores.

- **MyStorm BlackIce**: necesita unos paquetes adicionales, pero no pesan mucho. También tiene buena cantidad de Pmod; lo malo es la poca información que hay, a diferencia de las dos anteriores.

- **Color Ligth**: Tiene buena cantidad también de Pmod, pero es bastante complicada de usar. Las aplicaciones no necesitan mucho espacio y son baratas. Dependiendo de qué puertos se deseen usar, toca soldar, así que no la recomiendo mucho (con esta no he trabajado).

Si tienen la opción de escoger, les recomiendo altamente la Zybo Z7 siempre y cuando cuenten con el espacio, pero es la más cómoda de usar.

## Herramientas específicas

Una vez ya saben cuál de las FPGAs van a usar (o les tocó usar), toca instalar las herramientas que permitan conectar el dispositivo con la FPGA, así que dependiendo de una y otra van variando. Por esta razón aquí está la guía en cada una:

- [*Zybo Z7*](/FPGAS/Zybo%20z7/ZyboZ7.md)
- [*Cyclone IV*](/FPGAS/Cyclone%20IV/CycloneIV.md) (en progreso, no está todavía)
- [*MyStorm BlackIce*](/FPGAS/My%20Storm%20Blackice/Blackice.md)
- [*Color Ligth*](/FPGAS/Colorligth/Colorligth.md) (en progreso, no está todavía)

## Referencias

Páginas web:

- [Documentación de Verilog](https://www.verilog.com/)
- [Testbench con Verilog](https://vlsiverify.com/verilog/writing-a-testbench-in-verilog/)
- [Página oficial Zybo Z7](https://digilent.com/reference/programmable-logic/zybo-z7/start)
- [Página oficial Cyclone IV](https://www.altera.com/products/fpga/cyclone/iv)
- [Guía de BlackIce](https://www.tindie.com/products/folknology/blackice-mx/)
- [Guía de Colorlight](https://tomverbeure.github.io/2021/01/22/The-Colorlight-i5-as-FPGA-development-board.html)
