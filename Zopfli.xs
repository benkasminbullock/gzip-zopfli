#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include "gzip-zopfli-perl.c"

typedef gzip_zopfli_t * Gzip__Zopfli;

MODULE=Gzip::Zopfli PACKAGE=Gzip::Zopfli

PROTOTYPES: DISABLE

BOOT:
	/* Gzip__Zopfli_error_handler = perl_error_handler; */

