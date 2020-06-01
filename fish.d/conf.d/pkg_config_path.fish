if test -x brew
  set -l pcp (brew --prefix)

  set -g -x PHP_BUILD_CONFIGURE_OPTS "--enable-intl --with-zlib-dir=$pcp/opt/zlib --with-bz2=$pcp/opt/bzip2 --with-curl=$pcp/opt/openssl@1.1 --with-iconv=$pcp/opt/libiconv --with-tidy=$pcp/opt/tidy-html5"
  set -g -x PKG_CONFIG_PATH "$pcp/opt/krb5/lib/pkgconfig $pcp/opt/openssl/lib/pkgconfig $pcp/opt/icu4c/lib/pkgconfig $pcp/opt/libedit/lib/pkgconfig $pcp/opt/libxml2/lib/pkgconfig $PKG_CONFIG_PATH"
else if -x pacman
  set -g -x PHP_BUILD_CONFIGURE_OPTS "--enable-intl --with-pear"
  set -g -x PHP_BUILD_EXTRA_MAKE_ARGUMENTS -j12
end
