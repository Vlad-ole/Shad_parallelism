#include <mpi.h>
#include <stdio.h>

enum {
    COMM_SIZE_MAX = 16
   
};

#define SIZE 16
#define UP    0
#define DOWN  1
#define LEFT  2
#define RIGHT 3

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    int commsize;
    MPI_Comm_size(MPI_COMM_WORLD, &commsize);

    if (commsize != COMM_SIZE_MAX) {
        fprintf(stderr, "Need %d processes\n", COMM_SIZE_MAX);
        MPI_Abort(MPI_COMM_WORLD, 1);
    }
    
    // Create grid of processes
    int dims[2] = {4, 4};
    int periods[2] = {0, 0};
    int reorder = 0;
    MPI_Comm gridcomm;
    MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &gridcomm);
    int rank;
    MPI_Comm_rank(gridcomm, &rank);
    int coords[2];
    MPI_Cart_coords(gridcomm, rank, 2, coords);
    int neibs[4];
    MPI_Cart_shift(gridcomm, 0, 1, &neibs[UP], &neibs[DOWN]);
    MPI_Cart_shift(gridcomm, 1, 1, &neibs[LEFT], &neibs[RIGHT]);

    // Send/recv data from neibs (up, down, left, right)
    int rbuf[4]; 
    int sbuf = rank;
    MPI_Request reqs[8];
    for (int i = 0; i < 4; i++) {
        int dest = neibs[i];
        int source = neibs[i];
        MPI_Isend(&sbuf, 1, MPI_INT, dest, 0, MPI_COMM_WORLD, &reqs[i]);
        MPI_Irecv(&rbuf[i], 1, MPI_INT, source, 0, MPI_COMM_WORLD, &reqs[i + 4]);
    }
    MPI_Status stats[8];
    MPI_Waitall(8, reqs, stats);
   
    printf("Process rank  %d, coords (%d, %d), neighbors (up, down, left, right) = (%d, %d, %d, %d)\n",
           rank, coords[0], coords[1], neibs[UP], neibs[DOWN], neibs[LEFT], neibs[RIGHT]);
    
    printf("Process rank %d: rbuf (up, down, left, right) = [%d, %d, %d, %d]\n",
           rank, rbuf[UP], rbuf[DOWN], rbuf[LEFT], rbuf[RIGHT]);
   
    MPI_Finalize();
    return 0;
}
