
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(32112);
 script_version ("$Revision: 1.4 $");
 script_name(english: "RHSA-2008-0224: thunderbird");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2008-0224");
 script_set_attribute(attribute: "description", value: '
  Updated thunderbird packages that fix a security issue are now available
  for Red Hat Enterprise Linux 4 and 5.

  This update has been rated as having moderate security impact by the Red
  Hat Security Response Team.

  Mozilla Thunderbird is a standalone mail and newsgroup client.

  A flaw was found in the processing of malformed JavaScript content. An HTML
  mail message containing such malicious content could cause Thunderbird to
  crash or, potentially, execute arbitrary code as the user running
  Thunderbird. (CVE-2008-1380)

  Note: JavaScript support is disabled by default in Thunderbird; the above
  issue is not exploitable unless JavaScript is enabled.

  All Thunderbird users should upgrade to these updated packages, which
  contain backported patches to resolve these issues.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2008-0224.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2008-1380");
script_summary(english: "Check for the version of the thunderbird packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"thunderbird-1.5.0.12-11.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"thunderbird-1.5.0.12-12.el5_1", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
