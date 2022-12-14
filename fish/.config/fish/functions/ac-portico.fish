function ac-portico --wraps='python ~/src/ewpe/gree-remote/PythonCLI/gree.py -c 10.103.1.203 -i 502cc66cec05 -k 7Ab0De3Gh6Jk9Mn2' --description 'control portico AC'
  python3 ~/src/ewpe/gree-remote/PythonCLI/gree.py -c 10.103.1.203 -i 502cc66cec05 -k 7Ab0De3Gh6Jk9Mn2 $argv; 
end
