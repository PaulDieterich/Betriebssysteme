#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <values.h>
#include <string.h>
#include "include/web_request.c"
#include <sys/time.h>

#define maxChar 256
#define QUEUESIZE 10

int threadsize = 10;
char input[maxChar];
char *parse[maxChar];


typedef struct {
    char *buf[QUEUESIZE];
    long head, tail;
    int full, empty;
    pthread_mutex_t lock;
    pthread_cond_t notFull, notEmpty;
} queue;


char strParse(char *input, char **parse) {

    for (int i = 0; i < maxChar; i++) {
        parse[i] = strsep(&input, " ");
        if (parse[i] == NULL) {
            break;
        }
        if (strlen(parse[i]) == 0) {
            i--;
        }
    }
}
queue* queueInit(void);
void* readFile(void*);
void* writeFile(void*);
int main() {     
    int anzahlThreads;
    queue *q = queueInit();
    pthread_t th; pthread_t threadArr[anzahlThreads];

    printf("Filename:");
    fgets(input, MAX_INPUT, stdin);
    input[strcspn(input, "\n")] = '\0';
    if ((void *) input[0] == NULL || *input == ' ') {
        printf("No input");
        exit(0);
    } else {
        strParse(input, parse);
    }

    printf("Anzahl threads:");
    scanf("%d",&anzahlThreads);


    pthread_create(&th, NULL, readFile, q);
    pthread_join(th, NULL);



    struct timeval tvbegin, tvend;
    gettimeofday(&tvbegin,NULL);


    for (int i = 0; i < anzahlThreads; i++) {
        printf("Create thread %d\n", i);
        pthread_create(&threadArr[i], NULL, writeFile, q);
    }

    for (int i = 0; i < anzahlThreads; i++) {
        pthread_join(threadArr[i], NULL);
    }

    gettimeofday(&tvend, NULL);

    printf("%lu", (tvend.tv_sec - tvbegin.tv_sec)*1000 +(tvend.tv_usec-tvbegin.tv_usec)/1000); //print duration
    printf("ms\n");

    return 0;

}

int queueSize(queue *q) {
    int rtr = (q->tail) - (q->head);
    return rtr;
}

char *queuePrint(queue *q) {
    int i = q->head;
    int j = q->tail;
    char *tmp;
    while (i != j) {
        tmp = q->buf[i++];
        printf("%s\n", tmp);
    }
}

queue *queueInit(void) {
    queue *q;

    q = (queue *) malloc(sizeof(queue));
    if (q == NULL) return (NULL);

    q->empty = 1;
    q->full = 0;
    q->head = 0;
    q->tail = 0;

    return (q);
}

void queueDelete(queue *q) {
    free(q);
}

void queueDel(queue *q, char *out) {
    *out = (char) q->buf[q->head];

    q->head++;
    if (q->head == QUEUESIZE)
        q->head = 0;
    if (q->head == q->tail)
        q->empty = 1;
    q->full = 0;


}

char *queueRead(queue *q) {
    char *out = q->buf[q->head];

    q->head++;
    if (q->head == QUEUESIZE)
        q->head = 0;
    if (q->head == q->tail)
        q->empty = 1;
    q->full = 0;

    return out;
}

void queueAdd(queue *q, char *in) {
    q->buf[q->tail] = strdup(in);
    q->tail++;
    if (q->tail == QUEUESIZE)
        q->tail = 0;
    if (q->tail == q->head)
        q->full = 1;
    q->empty = 0;


}
void *readFile(void *q) {

    queue *q2 = (queue *) q;

    FILE *fd_in;
    fd_in = fopen(parse[0], "r");
    if (fd_in == NULL) {
        perror("failed to open input file");
        exit(EXIT_FAILURE);
    }

    char url[maxChar];
    char *pos;

    while (fgets(url, sizeof(url), fd_in) != NULL) {
        if ((pos = strchr(url, '\n')) != NULL) {
            *pos = '\0';
        }
        pthread_mutex_lock(&q2->lock);
        /*if (&q2->full) {
            printf("QUEUE IS FULL.\n");
            pthread_cond_wait(&q2->notFull, &q2->lock);
            break;
        }*/
        queueAdd(q2, url);
        printf("readFile: Zur liste inzugefügte URL: %s.\n",url);
        pthread_mutex_unlock(&q2->lock);
        pthread_mutex_destroy(&q2->lock);
    }
    return NULL;
}

void *writeFile(void *q) {
    queue *tmp = (queue *) q;
    char *argv[2];
    argv[0] = "--webreq-delay 0";
    argv[1] = "--webreq-path download";

    webreq_init(2, argv);

    //for(int i = 0; i < QUEUESIZE; i++){
    while (!(tmp->empty)) {
        pthread_mutex_lock(&tmp->lock);
        /*  if(&tmp->empty){
            printf ("QUEUE IS EMPTY.\n");
            pthread_cond_wait (&tmp->notFull, &tmp->lock);
        }*/
        char *url = strdup(queueRead(q));
        char *downloadUrl = strdup(url);
        queueDel(tmp,url); //Queue vom eintrag befrien damit wieder platz wird.
        pthread_mutex_unlock(&tmp->lock);
        pthread_mutex_destroy(&tmp->lock);
        strtok(url, "/");

        char *domain = strtok(NULL, "/");
        unsigned int id = (unsigned int) pthread_self();
        printf("%d", id);

        char filename[64];
        snprintf(filename, sizeof(filename), "%i_%s.html", id, domain);
        printf("Downloading URL: %s\n", downloadUrl);

        webreq_download(downloadUrl, filename);
    }

}

