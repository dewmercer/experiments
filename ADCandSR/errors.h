#ifdef __cplusplus
extern "C" {
# endif

# ifndef __ERRORS_H__
# define __ERRORS_H__

// SPI Errors
#define SPI_OPEN_ERROR -1
#define SPI_MODE_CHANGE_ERROR -2
#define SPI_BPW_CHANGE_ERROR -3
#define SPI_SPEED_CHANGE_ERROR -4
#define SPI_IOCTL_ERROR -5
#define SPI_NOT_OPEN_ERROR -6
#define SPI_ZERO_SPEED_ERROR -7
#define SPI_SPEED_CONFLICT_ERROR -8



// General Errors
#define INVALID_PIN_NUMBER -100
#define INVALID_BUFFER_LENGTH -101


#define UNKNOWN_ERROR 0xFFFFFFFF
# endif
#ifdef __cplusplus
}
#endif
