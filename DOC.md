## /attitude

### ars.c/.h

- https://pt.wikipedia.org/wiki/Filtro_de_Kalman

O arquivo contem o filtro de kalman, esse filtro é usado nos inputs e data dos sensores. o código possui duas funções, uma para prever o movimento atualizar as variaveis do calculo do reajuste, e outra é para aplicar esse reajuste no modelo do giroscopio.

### attitude.c/.h

Estimador de ampliture. Aplica algumas contas do filtro e da acesso a funções de leitura dos angulos e também a criação da estrutura do giroscópio. serve para atualizar o pitch,roll e o yaw do drone.

## /fly

### controlthread.c/.h

Este código representa o controle total do drone, interligando todas as outras bibliotecas e mantendo o drone voando. ele realiza todas as configurações iniciais para o drone iniciar o voo, além do controle de log dos dados adquiridos com sensores e dados das saidas.

### pid.c/.h

biblioteca do controle PID

## gpio

### gpio.c/.h

Envia comando de controle de entrada e saida;

## /motorboard

### mot.c/.h

Código do controle dos controles, usando structs para simuar POO. utilizar a lib da motorboard para comunicação com os motores.

### motorboard.c/.h

Comunicação com os motores utilizando a biblioteca POSIX termios.h, utiliza gpio para comunicação com os leds.

## /navboard

### navboard.c/.h

biblioteca para o controle de dados de navegação, contem estes valores:

- Instante de tempo da amostra, em segundos, com resolução de microssegundos.
- Intervalo de tempo desde a última amostra, em segundos.
- Aceleração no eixo X, medida em G, considerando positivo quando a frente do dispositivo aponta para cima.
- Aceleração no eixo Y, medida em G, considerando positivo quando o lado esquerdo do dispositivo aponta para cima.
- Aceleração no eixo Z, medida em G, considerando positivo quando o topo do dispositivo aponta para cima.
- Velocidade angular no eixo X, em rad/s, positiva para rotação à direita (rolagem para a direita).
- Velocidade angular no eixo Y, em rad/s, positiva para rotação à direita (inclinação para baixo / pitch down).
- Velocidade angular no eixo Z, em rad/s, positiva para rotação à direita (guinada para a esquerda / yaw).
- Temperatura medida pelo sensor, em graus Celsius.
- Altura em relação ao solo, em centímetros.
- Indicador lógico que informa se a medida de altura é nova (1) ou se é repetida (0).
- Temperatura interna associada ao acelerômetro.
- Temperatura interna associada ao giroscópio.

Também serve para fazer a calibragem e pegar uma leitura de dados utilizando a struct "nav_struct".

## /udp

### /udp.c/.h

biblioteca para iniciar a comunicação via wifi? usa a biblioteca da inet.h junto com socket.h para realizar comunicação udp. a lib permite a inicialização do client e do server, tanto quanto o envio de mensagens do client e o recebimento no server. Não sei para que usaria isto cinceramente. e também acredito que se for usar, tenho que ter no meu computador o codigo para o client, seria uma boa reescrever o código e importar alguma lib para o drone que seja mais atual talvez? Apesar que esta funcionando, talvez só emplementar o recebimento de mensagem no client e o envio no server para fazer uma comunicação completa.

### mainudpserver.c/*client.c

exemplo de como usar o udp.c/.h

## /util

utilitarios para codar

### type.h

ao inves de usar isto, irei usar a lib stdint.h que é POSIX.

### util.c/.h

implementa um "getch" do windows e dois timestamp, um em segundos com resolução de microsegundos e outro em microsegundos.

## /vbat

### i2c-dev.h

biblioteca do i2c, talvez no kernel do drone não tenha um próprio.

### bat.c/.h

lib para fazer a leitura da bateria do drone que utiliza i2c para comunicação com sensores.

## /video

### video.c/.h

biblioteca para o video. Usa um thread separado.sinceramente eu não entendi para aonde ele envia o video, ou se ele só faz a leitura e fica gravando em imagem no proprio sistema. bem confuso isso, mas terei que fazer funcionar aaaaaa.

lendo o código de exemplo que ele deixou, ao que parece o video fica em um device -> /dev/video1, teria que ver como mandar esses dados via wifi para testes.