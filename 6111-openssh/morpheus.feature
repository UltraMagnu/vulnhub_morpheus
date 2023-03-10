## Version 1.4.1
## languaje: en 


Feature:
    TOE:
    Category:
	Unsafe Imput 
    Location:
	http://testasp.vulnweb.com/Search.asp?
    CWE:
    	Vulnerabilidad en OpenSSH (CVE-2019-6111)
      	https://www.rapid7.com/db/vulnerabilities/    openbsd-openssh-cve-2019-6111/
  Rule:
    REQ.173 Discard Unsafe Inputs
      
  Goal:
    Detect and exploit unsafe inputs
  Recommendation:
    Always use parametrized queries

  Background:
    |  <Software name>       |       <Version>     |
    | Kali GNU/Linux Rolling |        2022.3       |
    | Firefox ESR            | 91.11 Oesr (64 bit) |
  TOE information:
    Given I am accessing an "php" website
   

  Scenario: Normal use case
    Given I access http://192.168.64.131:81
    When I go to "login" tab
    Then It's displayed a login form

  Scenario: Static detection
    When I don't have acces to source code
    Then I can't do the static detection

  Scenario: Dynamic detection
    Given I access http://testaspnet.vulnweb.com
    When I look for a post or comments session
    Then I find http://testaspnet.vulnweb.com/Comments.aspx?id=0
    And I try to modify the end of de URL to try a SQLi
    """
    http://testaspnet.vulnweb.com/Comments.aspx?id=0'
    """
    And I get an error that is espected if the site is vulnerable
    Then I recognize the site is vulnerable to a SQL injection
