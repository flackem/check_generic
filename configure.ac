#---
#--- configure.ac
#---
#--- (c) 2008-2009 Matthias Flacke
#---
#--- plenty of configuration options 
#---
#--- prerequisites, credits and Nagios defaults
AC_PREREQ(2.59)
AC_INIT(check_generic, (author: matthias.flacke@gmx.de))

AC_DEFINE([DEFAULT_NAGIOS_USER], [nagios], [Default Nagios User])
AC_DEFINE([DEFAULT_NAGIOS_GROUP], [nagios], [Default Nagios Group])

AC_PREFIX_DEFAULT(/usr/local/nagios)

#---
#--- package settings, some of them dynamic
PKG_NAME=check_generic
PKG_VERSION="$Rev$"
PKG_AUTHOR="$Author$"
PKG_HOME_URL="http://my-plugin.de/check_generic/"
PKG_REL_DATE="$Date$"
PKG_ID="$Id$"
COMMA=","

AC_SUBST(PKG_NAME)
AC_SUBST(PKG_VERSION)
AC_SUBST(PKG_AUTHOR)
AC_SUBST(PKG_HOME_URL)
AC_SUBST(PKG_REL_DATE)
AC_SUBST(PKG_ID)
AC_SUBST(COMMA)

#---
#--- checks for programs
AC_PROG_MAKE_SET
#AC_PATH_PROG([STRIP],[strip],[true])
AC_PATH_PROG(CHMOD,chmod)
AC_PATH_PROG(CP,cp)
AC_PATH_PROG(ETHTOOL,ethtool)
AC_PATH_PROG(GUNZIP,gunzip)
AC_PATH_PROG(ID,id)
AC_PROG_INSTALL
AC_PATH_PROG(PERL,perl)

#---
if test "${exec_prefix}" = "NONE"; then
	exec_prefix="${prefix}"
fi


client_perl=no
AC_ARG_WITH(client_perl,                [  --with-client_perl=<perl path>           sets perl cmdline / path (e.g. #!/usr/bin/perl)],client_perl=$withval,client_perl="no")
if test client_perl=no; then
	AC_PATH_PROG(client_perl,perl)
fi
AC_MSG_RESULT([ Client perl path        $client_perl])
AC_ARG_WITH(configfile,			[  --with-configfile=<path>                 file check_generic options (default:${sysconfdir}/check_generic/check_generic_options.cfg)],config_dir=$withval,config_dir="${sysconfdir}/check_generic/check_generic_options.cfg")
AC_ARG_WITH(ignore_rc,			[  --with-ignore_rc=<0|1>                   Should RCs be ignored? (default:1)],ignore_rc=$withval,ignore_rc=1)
AC_ARG_WITH(empty_output_is_ok,		[  --with-empty_output_is_ok=<0|1>          Empty output to be flagged OK? (default:1)]empty_output_is_ok,=$withval,empty_output_is_ok="1")
AC_ARG_WITH(maxage,			[  --with-maxage=<hours>                    maximum age of temporary files before cleanup (default:24)],maxage=$withval,maxage=24)
AC_ARG_WITH(match_stderr,		[  --with-match_stderr=<0|1>                match should include STDERR? (default:0)],match_stderr=$withval,match_stderr=0)
AC_ARG_WITH(match_is_output,		[  --with-match_is_output=<0|1>             only the matched pattern is output],match_is_output=$withval,match_is_output=0)
AC_ARG_WITH(name,		        [  --with-name=<namestring>                 name string (default:'')],name=$withval,name='')
AC_ARG_WITH(report,			[  --with-report=<NN>                       default report option (default:13)],report=$withval,report="13")
AC_ARG_WITH(timeout,			[  --with-timeout=<NN>                      timeout for check (default:10)],timeout=$withval,timeout="10")
AC_ARG_WITH(tmp_dir,			[  --with-tmp_dir=<path>                    /path/to/tmp_dir (default:/tmp/check_generic)],tmp_dir=$withval,tmp_dir="/tmp/check_generic")
AC_ARG_WITH(tmp_dir_permissions,	[  --with-tmp_dir_permissions=<octal perms> permissions of tmp_dir (default:41777)],tmp_dir_permissions=$withval,tmp_dir_permissions="41777")
AC_ARG_WITH(type,			[  --with-type=<data-type>                  data type (scalar, delta), (default:scalar)],type=$withval,type="scalar")
AC_ARG_WITH(verbose,			[  --with-verbose=<N>                       verbosity of check_generic (default:0)],verbose=$withval,verbose="0")


#--- substitutions
AC_SUBST(INSTALL)
AC_SUBST(INSTALL_OPTS)
AC_SUBST(datarootdir)
AC_SUBST(LIBEXECDIR)
AC_SUBST(ac_configure_args)
AC_SUBST(client_perl)
AC_SUBST(configfile)
AC_SUBST(ignore_rc)
AC_SUBST(empty_output_is_ok)
AC_SUBST(escape_chars)
AC_SUBST(maxage)
AC_SUBST(match_stderr)
AC_SUBST(match_is_output)
AC_SUBST(name)
AC_SUBST(report)
AC_SUBST(timeout)
AC_SUBST(tmp_dir)
AC_SUBST(tmp_dir_permissions)
AC_SUBST(type)
AC_SUBST(verbose)

AC_CONFIG_FILES(
	subst
	Makefile 
	contrib/Makefile
	plugins/Makefile
	plugins/t/Makefile
)

AC_OUTPUT

#--- 
#--- substitution itself
$PERL subst plugins/Makefile
$PERL subst plugins/check_generic
$PERL subst plugins/t/Makefile
$PERL subst plugins/t/10_check_generic.t
$PERL subst plugins/t/testopts.pm
$PERL subst contrib/Makefile

#---
echo
echo
echo "*** Next step:  type 'make all'. ***"
echo ""
