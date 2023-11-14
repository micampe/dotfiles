function ac-scan --wraps='gree.py -b 10.103.1.255 search' --description 'scan the network for AC units'
  gree.py -b 10.103.1.255 search $argv; 
end
