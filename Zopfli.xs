#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#ifdef WIN32
#undef malloc
#undef free
#endif /* def WIN32 */

#include "zopfli-one.c"
#include "gzip-zopfli-perl.c"


typedef gzip_zopfli_t * Gzip__Zopfli;

MODULE=Gzip::Zopfli PACKAGE=Gzip::Zopfli

PROTOTYPES: DISABLE

SV *
ZopfliCompress(in, ...)
	SV * in;
PREINIT:
	gzip_zopfli_t gz = {0};
CODE:
	gzip_zopfli_init (& gz);
	RETVAL = gzip_zopfli (& gz, in);
OUTPUT:
	RETVAL
