AC_PREREQ(2.52)

AC_INIT([Apertium French-Spanish], [0.9.3], [apertium-stuff@lists.sourceforge.net], [apertium-fr-es])
AM_INIT_AUTOMAKE
AC_PROG_AWK

PKG_CHECK_MODULES(APERTIUM, apertium >= 3.7.0)
PKG_CHECK_MODULES(LTTOOLBOX, lttoolbox >= 3.5.3)
PKG_CHECK_MODULES(APERTIUM_LEX_TOOLS, apertium-lex-tools >= 0.2.6)

AP_MKINCLUDE

AC_OUTPUT([Makefile])
