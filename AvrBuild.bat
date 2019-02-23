@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "F:\AVR-Project\Assignment\labels.tmp" -fI -W+ie -C V2E -o "F:\AVR-Project\Assignment\Assignment.hex" -d "F:\AVR-Project\Assignment\Assignment.obj" -e "F:\AVR-Project\Assignment\Assignment.eep" -m "F:\AVR-Project\Assignment\Assignment.map" "F:\AVR-Project\Assignment\Assignment.asm"
