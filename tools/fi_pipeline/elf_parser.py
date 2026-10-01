import sys
import json
from elftools.elf.elffile import ELFFile
from elftools.elf.sections import SymbolTableSection

def extract_injection_targets(elf_path):
    targets = {'functions': [], 'variables': []}
    
    try:
        with open(elf_path, 'rb') as f:
            elffile = ELFFile(f)
            symtab = elffile.get_section_by_name('.symtab')
            
            if not isinstance(symtab, SymbolTableSection):
                print("[ERROR] .symtab section not found in the binary.")
                return targets

            for sym in symtab.iter_symbols():
                if sym['st_value'] == 0 or sym['st_size'] == 0 or not sym.name:
                    continue
                
                sym_type = sym['st_info']['type']
                
                if sym_type == 'STT_FUNC':
                    targets['functions'].append({
                        'name': sym.name, 
                        'address': hex(sym['st_value']), 
                        'size': sym['st_size']
                    })
                elif sym_type == 'STT_OBJECT':
                    targets['variables'].append({
                        'name': sym.name, 
                        'address': hex(sym['st_value']), 
                        'size': sym['st_size']
                    })
                    
    except Exception as e:
        print(f"[ERROR] Failed during ELF parsing: {e}")
        
    return targets

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python elf_parser.py <path_to_elf.exe>")
        sys.exit(1)
        
    target_path = sys.argv[1]
    results = extract_injection_targets(target_path)
    
    print(f"[INFO] Analysis completed for: {target_path}")
    print(f"[INFO] RASM (Control-Flow) targets identified: {len(results['functions'])}")
    print(f"[INFO] EDDI (Data/Memory) targets identified: {len(results['variables'])}")
    
    output_file = "injection_targets.json"
    with open(output_file, "w") as out_f:
        json.dump(results, out_f, indent=4)
        
    print(f"[INFO] All targets successfully exported to {output_file}")
