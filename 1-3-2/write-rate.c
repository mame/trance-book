#include <stdio.h>
#include <linux/soundcard.h>
int main() { printf("%lu\n", SOUND_PCM_WRITE_RATE); return 0; }
