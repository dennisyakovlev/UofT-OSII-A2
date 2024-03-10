#include <stdlib.h>
#include <stdio.h>

typedef struct something
{
    int (*arr)[8];
}
st;

int main()
{
    size_t sz = sizeof(int)*8 * 3 + sizeof(st);
    st* s = malloc(sz);
    for (int i=0; i!=3; ++i) for (int j=0; j!=8; ++j) s->arr[i][j]=i*j;
    for (int i=0; i!=3; ++i) for (int j=0; j!=8; ++j) printf("%d ",s->arr[i][j]);
    printf("\n");
    
    //int (*p)[8];
    //p = malloc(sizeof(*p) * 3);
    //for (int i=0; i!=3; ++i) for (int j=0; j!=8; ++j) p[i][j]=i*j;
    //for (int i=0; i!=3; ++i) for (int j=0; j!=8; ++j) printf("%d ",p[i][j]);
    //printf("\n");
}
