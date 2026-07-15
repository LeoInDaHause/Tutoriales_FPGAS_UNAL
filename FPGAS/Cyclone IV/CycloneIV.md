# Cyclone IV

La Cyclone IV es una FPGA de Altera, se programa con una aplicación llamada Quartus y en el laboratorio hay varios tipos de esta referencia.

Links importantes de acceso rapido:

- [Salidas Pmod]
- [Creación de proyecto]
- [Archivo Constrains]

## Pin Out

Como el laboratorio tiene diferentes versiones, les recomiendo ir a la página oficial de Cyclone y buscar el modelo que estén usando.

**Link de la página**: [Página de Altera](https://www.altera.com/design/devices/resources/pinouts).

En la página se van a encontrar todos los tipos de FPGA de Altera; escoger las siguientes:

![Seleccionar FPGA](/FPGAS/Cyclone%20IV/img/select.png)

Después revisar el **PDF** de la versión de FPGA que tengan.

## Quartus (Espacio de Trabajo)

Las Cyclone IV son FPGA desarrolladas por Altera, que son manejadas por Intel. Debido a esto, ellos tienen su propio programa para utilizar las FPGA con las cuales se puede compilar y ejecutar el código. Lo primero que se necesita es instalar Quartus ya sea en Linux o Windows; para esto tienen que ir a la siguiente página:

- Instalación Windows

    [Descargar Windows](https://www.altera.com/downloads/fpga-development-tools/quartus-prime-lite-edition-design-software-version-25-1-windows)

- Instalación Linux:

    [Descargar Linux](https://www.altera.com/downloads/fpga-development-tools/quartus-prime-lite-edition-design-software-version-25-1-linux)

    Tener en cuenta que en Linux toca ejecutar los siguientes comandos para darle permisos y poder ejecutar el instalador:

    ```bash
    cd ~/Descargas # Carpeta donde dejaron el instalador
    ```

    ```bash
    chmod +x qinst-lite-linux-25.1std-1129.run
    ```

    ```bash
    ./qinst-lite-linux-25.1std-1129.run
    ```

Una vez descargado, instalar las siguientes opciones tanto para Linux como para Windows.

![opciones](/FPGAS/Cyclone%20IV/img/options.png)

**Recuerden instalar el driver del blaster cuando se abra la ventana**. Con esas opciones debería de funcionar para instalar los drivers y detectar la FPGA.

## Creación de proyecto

Una vez ya esté instalado el Quartus, podemos pasar a crear el proyecto. Para eso vamos a abrir la aplicación y escoger nuevo proyecto. Se puede desde ``New Proyect Wizard`` o desde ```file -> New Proyect Wizard```

![crear](/FPGAS/Cyclone%20IV/img/proyect.png)

Aquí vamos a crear nuestro proyecto dando el nombre que queramos y escogiendo la carpeta donde queremos que sea almacenado.

![ubicacion](/FPGAS/Cyclone%20IV/img/location.png)

Continuamos con un ```empty project```, después descargamos el archivo que se encuentra [acá](/FPGAS/Cyclone%20IV/src/blink.v) y lo agregamos.

![archivo](/FPGAS/Cyclone%20IV/img/addfile.png)

A continuación vamos a ir a escoger la referencia de la FPGA; una vez sabiendo cuál es la que están manejando, la escogen en esta parte:

![familia](/FPGAS/Cyclone%20IV/img/family.png)

y en dispositivos escogen la versión de FPGA que manejen de esta forma:

![fpga](/FPGAS/Cyclone%20IV/img/fpga.png)

Y en la última parte recuerden dejar el lenguaje como Verilog HDL, ya que el archivo que se maneja está en ese lenguaje.

Al final aparecerá un resumen con todas las opciones; dar en finish y aceptar la ventana de confiar en proyectos.

Una vez abierto debería aparecer el código del archivo el cual se había descargado, en esta parte solo nos queda darle a ```Compile Design```.

![compilar](/FPGAS/Cyclone%20IV/img/compile.png)

Si todo está bien, debería aparecer todo bien. Ahora toca asignar los pines; en Quartus esto se hace mediante el pin planner integrado que tiene la aplicación.

![pinplaner](/FPGAS/Cyclone%20IV/img/pinplaner.png)

Esto abre una ventana nueva en donde vamos a ajustar los nombres a los pines que tiene la FPGA. Es importante saber cuál se está usando; por esto toca revisar el pin planner en esta página **[Página Altera del pin out](https://www.altera.com/design/devices/resources/pinouts)**.

Ya sabiendo cuáles son los pines que se usan, se asignan dependiendo del número, dando doble click en la columna de ```Location``` y seleccionando el pin.

![sel_pin](/FPGAS/Cyclone%20IV/img/select_pin.png)

Ya una vez esto debería aparecer que toca volver a hacer las etapas de síntesis de esta manera:

![regenerar](/FPGAS/Cyclone%20IV/img/regenerate.png)

Volver a ejecutar ```Compile Design```. Ya si no hay errores, podemos pasar a programar el dispositivo; esto se hace desde la parte de ```Program Device``` -> ```Hardware Setup``` y seleccionar el **USB Blaster**

![usb_blaster](/FPGAS/Cyclone%20IV/img/usbblaster.png)

Por último darle a ```Start``` y debería verse un led parpadeando.

![final](/FPGAS/Cyclone%20IV/img/finish.png)
