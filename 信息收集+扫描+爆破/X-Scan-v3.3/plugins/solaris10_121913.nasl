#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(26982);
 script_version("$Revision: 1.8 $");

 script_name(english: "Solaris 5.10 (sparc) : 121913-20");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 121913-20");
 script_set_attribute(attribute: "description", value:
'Portal Server 7.0: Miscellaneous Fixes.
Date this patch was last updated by Sun : Jun/26/09');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-121913-20-1");
 script_set_attribute(attribute: "risk_factor", value: "Medium");
 script_end_attributes();

 script_summary(english: "Check for patch 121913-20");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-admin", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-base", version:"7.0,REV=2005.12.12.01.50");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-portlets", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-search", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-sracommon", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-sracore", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-sragateway", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-sranetletproxy", version:"7.0,REV=2005.12.12.01.53");
e +=  solaris_check_patch(release:"5.10", arch:"sparc", patch:"121913-20", obsoleted_by:"", package:"SUNWportal-srarewriterproxy", version:"7.0,REV=2005.12.12.01.53");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_warning(0);
	else  
	   security_warning(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
