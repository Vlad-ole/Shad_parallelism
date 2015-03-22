#include <mpi.h>
#include <stdio.h>

#define NELEMS(x) (sizeof(x) / sizeof(x)[0])

int main(int argc, char **argv)
{
    int rank, commsize, len, prev, next, tag1 = 1, tag2 = 2;
    char host[MPI_MAX_PROCESSOR_NAME];
    char inbuf_prev[50], inbuf_next[50], outbuf_prev[50], outbuf_next[50];
    MPI_Request reqs[4];
    MPI_Status stats[4];
    
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &commsize);
    MPI_Get_processor_name(host, &len);

    prev = (rank + commsize - 1) % commsize;
    next = (rank + 1) % commsize;
    
    snprintf(outbuf_prev, NELEMS(outbuf_prev), "Hello, prev. I am %d of %d on %s", rank, commsize, host);
    snprintf(outbuf_next, NELEMS(outbuf_next), "Hello, next. I am %d of %d on %s", rank, commsize, host);
    MPI_Isend(outbuf_prev, NELEMS(outbuf_prev), MPI_CHAR, prev, tag1, MPI_COMM_WORLD, &reqs[0]);
    MPI_Isend(outbuf_next, NELEMS(outbuf_next), MPI_CHAR, next, tag2, MPI_COMM_WORLD, &reqs[1]);

    MPI_Irecv(inbuf_prev, NELEMS(inbuf_prev), MPI_CHAR, prev, tag2, MPI_COMM_WORLD, &reqs[2]);
    MPI_Irecv(inbuf_next, NELEMS(inbuf_next), MPI_CHAR, next, tag1, MPI_COMM_WORLD, &reqs[3]);
    
    MPI_Waitall(4, reqs, stats);
    printf("[%d] Msg from %d (prev): '%s'\n", rank, stats[2].MPI_SOURCE, inbuf_prev);
    printf("[%d] Msg from %d (next): '%s'\n", rank, stats[3].MPI_SOURCE, inbuf_next);

    MPI_Finalize();
    return 0;
}
