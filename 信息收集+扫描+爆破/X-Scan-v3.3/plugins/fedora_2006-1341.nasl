
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2006-1341
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24063);
 script_version ("$Revision: 1.4 $");
script_name(english: "Fedora 5 2006-1341: mod_auth_kerb");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2006-1341 (mod_auth_kerb)");
 script_set_attribute(attribute: "description", value: "mod_auth_kerb is module for the Apache HTTP Server designed to
provide Kerberos authentication over HTTP.  The module supports the
Negotiate authentication method, which performs full Kerberos
authentication based on ticket exchanges.

Update Information:

This update includes the latest upstream release of
mod_auth_kerb, version 5.3, which includes the fix for a
security issue.

An off by one flaw was found in the way mod_auth_kerb
handles certain Kerberos authentication messages. A remote
client could send a specially crafted authentication request
which could crash an httpd child process (CVE-2006-5989).

");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2006-5989");
script_summary(english: "Check for the version of the mod_auth_kerb package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"mod_auth_kerb-5.3-2.fc5", release:"FC5") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
