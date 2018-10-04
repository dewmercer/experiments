#ifdef __cplusplus
extern "C" {
# endif

# ifndef __ERRORS_H__
# define __ERRORS_H__

// SPI Errors
static const int SPI_OPEN_ERROR = -1;
static const int SPI_MODE_CHANGE_ERROR = -2;
static const int SPI_BPW_CHANGE_ERROR = -3;
static const int SPI_SPEED_CHANGE_ERROR = -4;
static const int SPI_IOCTL_ERROR = -5;
static const int SPI_NOT_OPEN_ERROR = -6;
static const int SPI_ZERO_SPEED_ERROR = -7;
static const int SPI_SPEED_CONFLICT_ERROR = -8;


static const int UNKNOWN_ERROR = 0xFFFFFFFF;
# endif
#ifdef __cplusplus
}
#endif
