set -l pcp (brew --prefix)

set -gx PHP_BUILD_CONFIGURE_OPTS --with-zlib-dir=$pcp/opt/zlib --with-bz2=$pcp/opt/bzip2 --with-curl=$pcp/opt/openssl@1.1 --with-iconv=$pcp/opt/libiconv --with-tidy=$pcp/opt/tidy-html5
set -gx PKG_CONFIG_PATH $pcp/opt/krb5/lib/pkgconfig $pcp/opt/openssl/lib/pkgconfig $pcp/opt/icu4c/lib/pkgconfig $pcp/opt/libedit/lib/pkgconfig $pcp/opt/libxml2/lib/pkgconfig $PKG_CONFIG_PATH
set -gx PHP_BUILD_EXTRA_MAKE_ARGUMENTS -j7
