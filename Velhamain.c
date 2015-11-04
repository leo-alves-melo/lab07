#include "api_robot.h" /* Robot control API */

#define N_SENSORES 15

#define LIMIAR_PERTO 600
#define LIMIAR_LONGE 1200

#define PERTO 0
#define MEDIO 1
#define LONGE 2

#define REPETICAO_INFINITA 1

#define TEMPO_INICIAL 1000

#define HORARIO 0
#define ANTI_HORARIO 1

void delay();

void inicializa(unsigned int *distances);

void retoRapido();

void retoDevagar();

void stop();

void gira(int sentido);

int testaGiroMovimento();

int testaFrente();

void desvia(int sentido);

/* main function */
void _start(void) 
{
  unsigned int distances[N_SENSORES];
  int distancia;
  int sentidoGiro;	


  inicializa(distances);

  /* O codigo do robo deve repetir infinitamente */
  while(REPETICAO_INFINITA) {

    distancia = testaFrente();

    /* Enquanto o obstaculo a frente nao estiver perto, segue reto rapidamente */
    while(distancia != PERTO) {

      if(distancia == LONGE) {
        retoRapido();
      }
      if(distancia == MEDIO) {
        retoDevagar();

        sentidoGiro = testaGiroMovimento();

        desvia(sentidoGiro);
      }
      
      /* Atualiza a distancia a frente */
      distancia = testaFrente();
    }

    /* Com obstaculo proximo, ele deve parar e achar um espaco vazio */
    stop();    

    sentidoGiro = testaSentidoGiro(distances);

    /* Gira ateh encontrar a saida */
    while(read_sonar(3) < LIMIAR_PERTO && read_sonar(4) < LIMIAR_PERTO) {
      gira(sentidoGiro);
    } 
    

  }

  
}

/* Spend some time doing nothing. */
void delay(int tempo)
{
  int i;
  /* Not the best way to delay */
  for(i = 0; i < tempo; i++ );  
}

/* Seta as configuracoes iniciais do robo */
void inicializa(unsigned int *distances) {

  set_speed_motors(0,0);
  read_sonars(distances);
  delay(TEMPO_INICIAL);

}

/* Anda rapidamente pra frente */
void retoRapido() {

  set_speed_motors(30,30);
}

/* Anda devagar para frente */
void retoDevagar() {

  set_speed_motors(12, 12);
}

void stop() {
  set_speed_motors(0,0);
}

/* Gira pra um sentido */
void gira(int sentido) { ///////////////////////////////////testar sentido

  /* Gira no sentido horario */
  if(sentido == HORARIO) {
    set_speed_motors(0, 15);
  }
  /* Gira no sentido anti-horario */
  else {
     set_speed_motors(15, 0);
  }  
}

/* Enquanto mover devagar, ele procura algum lado para desviar do obstaculo */
int testaGiroMovimento() {

  int retorno;

  /* Testa o sensor da esquerda */
  if(read_sonar(2) >= LIMIAR_LONGE) {
    retorno = ANTI_HORARIO;
  }
  /* Testa sensor da direita */
  else if(read_sonar(5) >= LIMIAR_LONGE) {
    retorno = HORARIO;
  }
  /* Mais a esquerda */
  else if(read_sonar(1) >= LIMIAR_LONGE) {
    retorno = ANTI_HORARIO;
  }
  /* Mais a direita */
  else if(read_sonar(6) >= LIMIAR_LONGE) {
    retorno = HORARIO;
  }
  /* Se nao houver distancias longes, testa para mais perto */
  /* Testa o sensor da esquerda */
  if(read_sonar(2) >= LIMIAR_PERTO) {
    retorno = ANTI_HORARIO;
  }
  /* Testa sensor da direita */
  else if(read_sonar(5) >= LIMIAR_PERTO) {
    retorno = HORARIO;
  }
  /* Mais a esquerda */
  else if(read_sonar(1) >= LIMIAR_PERTO) {
    retorno = ANTI_HORARIO;
  }
  /* Mais a direita */
  else if(read_sonar(6) >= LIMIAR_PERTO) {
    retorno = HORARIO;
  }
  /* Caso default */
  else {
    retorno = HORARIO;
  }


}

/* Testa se o melhor sentido de giro eh horario ou anti-horario */
int testaSentidoGiro(unsigned int *distances) {

  int i;  

  read_sonars(distances);

  /* Testa os sonares do sentido horario sentido horario */
  for(i = 5; i <= 11; i++) {
    if(distances[i] > LIMIAR_LONGE) {
      return HORARIO;
    }
  }

  /* Testa os sonares do sentido anti-horario sentido horario */
  for(i = 2; i >= 0; i--) {
    if(distances[i] > LIMIAR_LONGE) {
      return ANTI_HORARIO;
    }
  }
  for(i = 15; i >= 12; i--) {
    if(distances[i] > LIMIAR_LONGE) {
      return ANTI_HORARIO;
    }
  }

  /* Testa os sonares do sentido horario sentido horario para distancia media */
  for(i = 5; i <= 11; i++) {
    if(distances[i] > LIMIAR_PERTO) {
      return HORARIO;
    }
  }

  /* Testa os sonares do sentido anti-horario sentido horario */
  for(i = 2; i >= 0; i--) {
    if(distances[i] > LIMIAR_PERTO) {
      return ANTI_HORARIO;
    }
  }
  for(i = 15; i >= 12; i--) {
    if(distances[i] > LIMIAR_PERTO) {
      return ANTI_HORARIO;
    }
  }


  /* Se todos estiverem perto, continua girando */
  return HORARIO;

}

/* Testa se tem obstaculo a frente dos dois sensores frontais e qual sua distancia relativa */
int testaFrente() {

  unsigned short direito, esquerdo;
  int retorno;

  direito = read_sonar(4);
  esquerdo = read_sonar(3);

  if(direito < LIMIAR_PERTO || esquerdo < LIMIAR_PERTO) {
    retorno = PERTO;
  }
  else if(direito < LIMIAR_LONGE || esquerdo < LIMIAR_LONGE) {
    retorno = MEDIO;
  }
  else {
    retorno = LONGE;
  }

  return retorno;
}

void desvia(int sentido) {

  /* Desvia no sentido horario */
  if(sentido == HORARIO) {
    set_speed_motors(7, 15);
  }
  /* Desvia no sentido anti-horario */
  else {
     set_speed_motors(15, 7);
  } 
}
