import ast

def extract_variables_from_code(code):
    # Analiza el código fuente en un árbol de sintaxis abstracta
    tree = ast.parse(code)
    
    variables = []
    
    # Recorre los nodos del árbol para encontrar asignaciones de variables
    for node in ast.walk(tree):
        if isinstance(node, ast.Assign):
            for target in node.targets:
                if isinstance(target, ast.Name):
                    variables.append(target.id)
    
    return variables

def main():
    # Lee el código fuente desde un archivo
    with open('main.pyx', 'r') as file:
        code = file.read()
    
    # Extrae las variables
    variables = extract_variables_from_code(code)
    
    # Escribe las variables en un nuevo archivo
    with open('lib/content.d', 'w') as file:
        for var in variables:
            file.write(var + '\n')

if __name__ == '__main__':
    main()
