#ssh -R 8080:confluence.score:80 -p 24 kimchki@bubuk.pe.kr
#ssh -R 8080:confluence.score:80 -R 8090:jira.score:80 -p 24 kimchki@bubuk.pe.kr
ssh -R 26:172.21.70.73:22 -R 24:172.21.70.159:22 -R 3389:172.21.70.73:3389 -R 8070:gerrit.score:80 -R 8080:confluence.score:80 -R 8090:jira.score:80 -p 24 kimchki@bubuk.pe.kr
#ssh -R 8080:confluence.score:80 -R 24:172.21.70.159:22 -p 24 kimchki@bubuk.pe.kr
