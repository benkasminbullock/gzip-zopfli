typedef struct {
    /* Gzip, zlib or libdeflate. */
    int type;
    /* See zopfli.h. */
    ZopfliOptions options;
}
gzip_zopfli_t;

void
gzip_zopfli_init (gzip_zopfli_t * gz)
{
    gz->type = ZOPFLI_FORMAT_GZIP;
    ZopfliInitOptions (& gz->options);
}

SV *
gzip_zopfli (gzip_zopfli_t * gz, SV * in_sv)
{
    SV * out_sv;
    const unsigned char * in;
    STRLEN inl;
    unsigned char * out;
    size_t out_size;
    in = (const unsigned char *) SvPV(in_sv, inl);
    out = 0;
    out_size = 0;
    ZopfliCompress(& gz->options, gz->type,
		   in, (size_t) inl,
		   & out, & out_size);
    out_sv = newSVpv ((const char *) out, out_size);
    return out_sv;
}
