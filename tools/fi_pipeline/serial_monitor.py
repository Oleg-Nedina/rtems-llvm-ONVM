import sys
import time
import serial

class SerialObserver:
    def __init__(self, port='/dev/ttyUSB0', baudrate=115200, timeout=0.1):
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.ser = None

    def connect(self):
        try:
            self.ser = serial.Serial(self.port, self.baudrate, timeout=self.timeout)
            print(f"[OBSERVER] Connected to {self.port} at {self.baudrate} baud.")
        except Exception as e:
            print(f"[ERROR] Failed to open serial port {self.port}: {e}")
            sys.exit(1)

    def disconnect(self):
        if self.ser and self.ser.is_open:
            self.ser.close()

    def wait_for_result(self, max_wait_time=5.0):
        """
        Analizza l'output della board.
        Ritorna la classificazione: 'PASS', 'CFI_VIOLATION', 'EDDI_VIOLATION', 'SYSTEM_CRASH' o 'TIMEOUT'.
        """
        start_time = time.time()
        buffer = []
        
        while (time.time() - start_time) < max_wait_time:
            if self.ser.in_waiting > 0:
                try:
                    line = self.ser.readline().decode('utf-8', errors='ignore').strip()
                    if not line:
                        continue
                        
                    buffer.append(line)
                    print(f"[UART] {line}")
                    
                    # Logiche di parsing RTEMS
                    if "*** END OF TEST" in line or "TEST PASSED" in line:
                        return "PASS", buffer
                    # Parsing violazioni Control-Flow (RASM)
                    elif "CFI" in line or "RASM" in line or "Control-Flow" in line:
                        return "CFI_VIOLATION", buffer
                    # Parsing violazioni Dati (EDDI)
                    elif "EDDI" in line or "Memory Error" in line:
                        return "EDDI_VIOLATION", buffer
                    # Parsing CPU Exception Hardware (es. UsageFault)
                    elif "Exception handler called" in line or "HardFault" in line:
                        return "SYSTEM_CRASH", buffer
                        
                except Exception:
                    pass
            else:
                time.sleep(0.01)
                
        return "TIMEOUT", buffer

if __name__ == '__main__':
    port = sys.argv[1] if len(sys.argv) > 1 else '/dev/ttyACM0'
    observer = SerialObserver(port=port)
    observer.connect()
    
    print("[OBSERVER] Waiting for board output... (Test Window: 10s)")
    try:
        status, logs = observer.wait_for_result(max_wait_time=10.0)
        print(f"\n[OBSERVER] Final Status: {status}")
    except KeyboardInterrupt:
        print("\n[OBSERVER] Aborted by operator.")
    finally:
        observer.disconnect()
