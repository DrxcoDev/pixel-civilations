import pygame
import sys
import uuid

def crear_archivo_error(mensaje):
    # Generar un nombre de archivo aleatorio usando uuid
    nombre_archivo = f"error_{uuid.uuid4().hex}.txt"
    with open(nombre_archivo, 'w') as archivo:
        archivo.write(mensaje)
    print(f"Archivo de error creado: {nombre_archivo}")

try:
    # Inicializar Pygame
    pygame.init()
    pygame.font.init()

    # Definir dimensiones de la ventana
    ancho = 800
    alto = 600

    # Sprites import
    # Buttons import
    boton_imagen = pygame.image.load("../assets/Sprites/Buttons/l_pixel-btn_blue1.png")
    boton_imagen_rect = boton_imagen.get_rect()

    # Posicionar el botón en la ventana
    boton_imagen_rect.center = (300, 320)

    # Clouds import
    bg = pygame.image.load("../assets/Sprites/clouds/cloud1.png")
    bg1 = pygame.image.load("../assets/Sprites/clouds/cloud1.png")

    # Fuentes
    ComicSans = pygame.font.Font("../assets/Fonts/MainFont.ttf", 30)

    # Crear la ventana
    ventana = pygame.display.set_mode((ancho, alto))
    pygame.display.set_caption('Ventana en Pygame')

    # Configura el reloj para controlar la velocidad de la animación
    clock = pygame.time.Clock()
    FPS = 60

    # Configurar la animación del fondo
    bg_width = bg.get_width()
    bg_height = bg.get_height()
    bg_rect = pygame.Rect(0, 0, bg_width, bg_height)
    image_speed = 4  # Velocidad de movimiento

    bg1_width = bg1.get_width()
    bg1_height = bg1.get_height()
    bg1_rect = pygame.Rect(0, 0, bg1_width, bg1_height)
    image_speed = 4  # Velocidad de movimiento

    # Colores
    AZUL_CLARO = (111, 193, 221)

    # Bucle principal del juego
    ejecutando = True
    while ejecutando:
        # Procesar eventos
        for evento in pygame.event.get():
            if evento.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

            if evento.type == pygame.MOUSEBUTTONDOWN:
                if boton_imagen_rect.collidepoint(evento.pos):
                    print("¡Botón presionado!")

        # Mover la imagen de fondo hacia la derecha
        bg_rect.x += image_speed
        bg1_rect.x += image_speed

        # Si la imagen sale de la pantalla por la derecha, reiníciala desde el lado izquierdo
        if bg_rect.x >= ancho:
            bg_rect.x = -200
        if bg1_rect.x >= ancho:
            bg1_rect.x = -400

        btn_init = pygame.Rect(150 , 100, 200, 150)  # crea un objeto rect
        pygame.draw.rect(ventana, [255, 100, 0], btn_init)  # dibuja el rectángulo

        # Rellenar la ventana con color azul claro
        ventana.fill(AZUL_CLARO)

        # Dibujar el fondo en la ventana
        ventana.blit(bg, (bg_rect.x, 0))
        ventana.blit(bg1, (bg1_rect.x + 200, 200))

        # Añadir texto
        text_surface = ComicSans.render('Some Text', False, (0, 0, 0))
        ventana.blit(text_surface, (300, 250))

        ventana.blit(boton_imagen, boton_imagen_rect)

        # Actualizar la pantalla
        pygame.display.flip()

        # Controlar la velocidad del bucle
        clock.tick(FPS)

except Exception as e:
    mensaje_error = f"Ha ocurrido un error: {str(e)}"
    crear_archivo_error(mensaje_error)
    pygame.quit()
    sys.exit()
