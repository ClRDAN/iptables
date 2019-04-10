Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy DROP)
target     prot opt source               destination         
DOCKER-ISOLATION  all  --  anywhere             anywhere            
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain DOCKER (5 references)
target     prot opt source               destination         

Chain DOCKER-ISOLATION (1 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
DROP       all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            
