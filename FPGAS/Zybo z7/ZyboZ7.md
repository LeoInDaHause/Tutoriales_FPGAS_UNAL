# Zybo Z7

Una de las FPGAs más completas del laboratorio. Es muy versátil y tiene muchas aplicaciones tanto para proyectos como para desarrollo SoC (System on Chip). De las que he trabajado es la mejor, pero siempre se necesita bastante tiempo para instalar.

Links importantes de acceso rápido:

- [Salidas Pmod](/FPGAS/Zybo%20z7/img/pmod.png)
- [Creación de proyecto](#creación-de-proyecto)
- [Archivo Constraints](https://github.com/Digilent/Zybo-Z7-10-XADC/blob/master/src/constraints/Zybo-Z7.xdc)

![ZyboZ7](/FPGAS/Zybo%20z7/img/zyboz7.png)

## Pin Out

Lo primero que hay que observar son los pin out que tiene la FPGA. Esto es para reconocer qué nos puede dar la FPGA, qué podemos usar y cómo se debe usar.

![pionut](/FPGAS/Zybo%20z7/img/pinout.png)

<!-- markdownlint-disable MD060 -->
| Llamado | Descripción | Llamado | Descripción | Llamado | Descripción |
|---------|-------------|---------|-------------|---------|-------------|
| 1 | Encendido | 12 | Pmod alta velocidad * | 23 | Ethernet |
| 2 | Jumper energía | 13 | Botones de usuario | 24 | Fuente externa |
| 3 | USB JTAG/UART | 14 | LEDs RGB * | 25 | Ventilador 5V * |
| 4 | LED usuario MIO | 15 | XADC Pmod | 26 | Modo programación |
| 5 | Pmod MIO | 16 | Audio | 27 | LED power good |
| 6 | USB 2.0 Host/OTG | 17 | MAC única | 28 | LED programación |
| 7 | Jumper USB Host | 18 | JTAG externo | 29 | Reset procesador |
| 8 | Pmod estándar | 19 | HDMI entrada | 30 | Borrar configuración |
| 9 | Switches usuario | 20 | Pcam MIPI CSI-2 | 31 | Zynq-7000 |
| 10 | LEDs usuario | 21 | microSD | 32 | DDR3L |
| 11 | Botones MIO | 22 | HDMI salida | * | * diferencias Z7-10 y Z7-20 |
<!-- markdownlint-enable MD060 -->

Los Pmod se usan de la siguiente forma:

![pmod](/FPGAS/Zybo%20z7/img/pmod.png)

## Vivado/Vitis (Espacio de trabajo)

Para utilizar esta FPGA toca instalar un programa hecho por los creadores de la herramienta; este se llama Vivado y permite modificarla tanto en diagramas de bloques como en código.

*Nota: en el caso de **Linux** revisen que sí exista la librería libtinfo5; si usan Linux Mint o Ubuntu ya está instalada, en caso de Arch instálenla.*

La herramienta está disponible en la página de AMD, pero antes toca crear una cuenta acá: [**crear cuenta**](https://www.amd.com/en/registration/create-account.html)

Después se va a instalar la versión extraíble desde la web (necesitan un buen tiempo e internet) desde este enlace: [**instalador**](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html)

Ahora, dependiendo del sistema operativo, se instala ya sea la versión de Linux o Windows de esta forma:

- Linux

![linus_ins](/FPGAS/Zybo%20z7/img/inst_linux.png)

- Windows

![win_inst](/FPGAS/Zybo%20z7/img/inst_windows.png)

- Al ejecutarlo se debe seleccionar lo siguiente:

![paso1](/FPGAS/Zybo%20z7/img/paso1.png)

y darle en **Next**.

- Después escoger la opción de **Vivado ML Standard**

![paso2](/FPGAS/Zybo%20z7/img/paso2.png)

- Darle en continuar y aceptar las condiciones de uso:

![paso3](/FPGAS/Zybo%20z7/img/paso3.png)

- Después se escoge el directorio donde se quiera guardar

![paso4](/FPGAS/Zybo%20z7/img/paso4.png)

- Continuar e instalar:

![paso5](/FPGAS/Zybo%20z7/img/paso5.png)

Esperar a instalar y ejecutar el programa.

### Paso adicional para Linux

Al terminar de instalar el programa toca ejecutarlo desde la terminal, pero toca abrirlo desde el directorio. Para hacerlo más cómodo se le puede poner alias para llamar al archivo solo con un nombre. Para esto se abre la terminal y se ejecuta lo siguiente:

```bash
cd ~
```

A continuación se edita el archivo para darle el nombre:

```bash
nano .bashrc
```

Esto abre una terminal que se puede editar. Si se dirige uno al final del documento se puede agregar la instrucción siguiente:

```nano
alias vivado='/tools/Xilinx/2025.1/Vivado/bin/vivado'
```

Se guarda **(Ctrl + O)** y se cierra **(Ctrl + X)**. Solo queda reiniciar la terminal o bash con el siguiente comando:

```bash
source ~/.bashrc
```

Y ahora, al ejecutar desde la terminal el comando **vivado**, se debe abrir la aplicación.

```bash
vivado
```

## Creación de proyecto

Crear un proyecto es bastante sencillo. Al abrir la aplicación está la opción de crear proyecto nuevo; después darle la ubicación al proyecto:

![paso6](/FPGAS/Zybo%20z7/img/paso6.png)

Definir el proyecto como RTL y continuar.

![paso7](/FPGAS/Zybo%20z7/img/paso7.png)

Agregar los archivos de Verilog; acá van los que uno esté manejando en el proyecto. Para este ejemplo está el archivo: [blink](/FPGAS/Zybo%20z7/src/blink.v) para agregarlo en el símbolo de **+**:

![paso8](/FPGAS/Zybo%20z7/img/paso8.png)

Continuar y agregar los constraints, estos se encuentran en este [archivo](https://github.com/Digilent/Zybo-Z7-10-XADC/blob/master/src/constraints/Zybo-Z7.xdc) y describen los periféricos que tiene la FPGA.

![paso9](/FPGAS/Zybo%20z7/img/paso9.png)

Por último toca seleccionar la FPGA; en este caso es buscar: ```xc7z010clg400-1``` y seleccionar esa opción.

![paso10](/FPGAS/Zybo%20z7/img/paso10.png)

Por último se abrirá la ventana de Project Summary y dale a **Finish**.

## Implementación en FPGA

Para implementarlo se debe primero cambiar los constraints en la parte de ```Led RGB 6``` de la siguiente forma:

```tcl
## RGB LED 6
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { led_rgb[0] }]; # IO_L18P_T2_34 Sch=led6_r
set_property -dict { PACKAGE_PIN F17 IOSTANDARD LVCMOS33 } [get_ports { led_rgb[1] }]; # IO_L6N_T0_VREF_35 Sch=led6_g
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { led_rgb[2] }]; # IO_L8P_T1_AD10P_35 Sch=led6_b
```

El archivo se encuentra [**acá**](/FPGAS/Zybo%20z7/src/Zybo-Z7.xdc).

Por último toca subir el código a la FPGA; para esto toca conectarla al computador y hacer paso a paso lo siguiente:

1. Run implementation
2. Generate Bitstream
3. Connect device (En **PROGRAM AND DEBUG**)
4. Program device (selecciona el bitstream generado)

Con esto debería de generar un cambio en el LED RGB que tiene la FPGA.
