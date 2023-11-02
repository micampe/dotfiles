function ac-scan --wraps='python ~/src/ewpe/gree-remote/PythonCLI/gree.py -b 10.103.1.255 search' --description 'scan the network for AC units'
  python3 ~/src/ac-gree-remote/gree-remote/PythonCLI/gree.py -b 10.103.1.255 search $argv; 
end
