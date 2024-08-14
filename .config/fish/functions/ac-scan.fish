function ac-scan --wraps='gree.py -b 192.168.178.255 search' --description 'scan the network for AC units'
  gree.py -b 192.168.178.255 search $argv; 
end
