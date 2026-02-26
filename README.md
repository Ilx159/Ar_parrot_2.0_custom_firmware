# Ar_parrot_2.0_custom_firmware


link do compilador / toolchain utilizado:

https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads


porta 21 drone: ftp
porta 23: telnet


ip do drone: 192.168.1.1
---

## Dias

### 27/12/25

- Instalação de um compilador C para arquitetura ARM (arm-none-linux-gnueabihf).
- Reestruturação dos arquivos de compilação do projeto para funcionar em ambiente Linux, substituindo scripts originalmente pensados para Windows.
- Adaptação do projeto para uso do novo toolchain.
- Correção e atualização de funções de bibliotecas Linux que estavam obsoletas ou incompatíveis com compiladores modernos.

### 02/01/26

- Criação da documentação dos componentes do firmware já existentes.
- Analize do que pode ser melhorado, o que não é funcional e o que esta decente.

### 25/02/26

---

## Roteiro de Desenvolvimento (Foco em Código)

Este roteiro traduz os objetivos gerais do projeto em tarefas de desenvolvimento concretas e verificáveis.

### Fase 1: Build e Execução Mínima
_**Meta:** Ter um fluxo de trabalho onde um "hello world" em C é compilado no Linux, enviado ao drone e executado com sucesso._

- [x] **`ardrone/make.sh`**: Garantir que todos os `make.sh` nos subdiretórios (`fly`, `video`, etc.) funcionem em um ambiente Linux padrão, usando o toolchain `arm-none-linux-gnueabihf-gcc`.
- [ ] **`ardrone/util/hello_drone.c`**: Criar um programa mínimo que apenas imprime "Hello, Drone!" na saída padrão, para validar o processo de compilação e execução.
- [ ] **`scripts/upload.sh`**: Criar um script para automatizar a transferência de um binário compilado (ex: `hello_drone`) para o drone via `scp` ou `ftp`.

### Fase 2: Mapeamento e Teste de Hardware
_**Meta:** Criar programas de teste para interagir com os barramentos de hardware e confirmar os dispositivos corretos._

- [ ] **`ardrone/tools/uart_tester.c`**: Escrever um utilitário que abre, escreve e lê de uma porta serial (`/dev/tty*`) especificada por argumento. Usar para confirmar qual `tty` se comunica com a placa de motores.
- [ ] **`ardrone/tools/i2c_scanner.c`**: Desessvolver uma ferramenta que varre os barramentos I2C (`/dev/i2c-*`) e lista os endereços de dispositivos encontrados, para confirmar a presença de sensores.
- [ ] **`ardrone/gpio/main_gpio.c`**: Modificar o programa de GPIO existente para ser um utilitário de linha de comando que permita ligar/desligar um pino de GPIO específico (ex: para testar LEDs).

### Fase 3: Leitura de Sensores (Energia)
_**Meta:** Implementar um programa autônomo que lê e valida a tensão da bateria._

- [ ] **`ardrone/vbat/vbat.c` e `vbat.h`**: Isolar a lógica de leitura de tensão. A função principal deve ser `float get_battery_voltage(void)`.
- [ ] **`ardrone/vbat/main_vbat.c`**: Fazer com que o `main` chame `get_battery_voltage()` em um loop e imprima o valor na tela, permitindo a validação manual com um multímetro.

### Fase 4: Controle de Motores
_**Meta:** Enviar comandos de PWM diretamente para a placa de motores e girar um motor de forma controlada._

- [ ] **`ardrone/motorboard/motorboard.c`**: Revisar e adaptar o código para usar a porta serial correta identificada na Fase 2 (substituindo `/dev/ttyPA1` se necessário).
- [ ] **`ardrone/tools/motor_tester.c`**: Criar uma ferramenta de linha de comando para controle direto. Ex: `./motor_tester --motor 1 --pwm 100`.
- [ ] **Protocolo**: Garantir que a estrutura do comando (checksum, etc.) enviada em `motorboard.c` corresponda ao protocolo esperado pela placa de motores.

### Fase 5: Implementação do Controle (PID)
_**Meta:** Ter uma biblioteca de PID funcional e testável, separada da lógica de voo._

- [ ] **`ardrone/fly/pid.c` e `pid.h`**: Implementar uma estrutura `PIDController` e funções como `pid_init()`, `pid_update()` e `pid_reset()`. A função `pid_update()` receberá o *setpoint*, o valor atual do processo, e retornará a saída de controle.
- [ ] **`ardrone/tools/pid_simulator.c`**: (Opcional, mas recomendado) Criar um programa que simula um sistema simples (ex: um integrador) para testar a resposta do controlador PID no próprio PC, antes de usar no drone.

### Fase 6: Integração do Firmware
_**Meta:** Unir os módulos em um único programa executável que represente a lógica principal do firmware._

- [ ] **`ardrone/fly/main_fly.c`**: Transformar este arquivo no loop de controle principal.
- [ ] **Loop de Controle**: Implementar a sequência:
    1. Ler dados dos sensores (atitude, altura - inicialmente podem ser *stubs*).
    2. Calcular os erros em relação aos *setpoints* (comandos do piloto).
    3. Chamar `pid_update()` para cada eixo de controle (roll, pitch, yaw).
    4. Mapear a saída dos PIDs para comandos de PWM dos motores.
    5. Enviar os comandos para a placa de motores.
    6. Repetir.
