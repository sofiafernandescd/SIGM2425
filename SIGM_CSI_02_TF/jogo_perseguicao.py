import pygame
import pymunk
import pymunk.pygame_util
import psycopg2 # MacOS pip install psycopg2-binary
import dotenv
import os

# Carregar variáveis de ambiente
dotenv.load_dotenv()
pw = os.getenv('PW')
print('PASSWORD:', pw)

# Conexão com o banco de dados
conn = psycopg2.connect(
    database="my_gis_top",
    user="postgres",
    password=pw,
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# Consulta para obter os dados do terreno e rios
cur.execute("SELECT ST_AsText(geom) FROM seus_dados WHERE tipo = 'terreno';")
terrenos = cur.fetchall()
# ... (similar para os rios)

pygame.init()
screen = pygame.display.set_mode((800, 600))
clock = pygame.time.Clock()
draw_options = pymunk.pygame_util.DrawOptions(screen)

# Espaço físico
space = pymunk.Space()
space.gravity = (0, 1000)

# Função para criar um corpo estático a partir de um polígono PostGIS
def create_static_body_from_wkt(space, wkt):
    # Converter WKT para uma lista de pontos
    # ... (utilizar uma biblioteca como Shapely)
    shape = pymunk.Poly.create(body, points)
    space.add(body, shape)
    return shape

# Criar os corpos no espaço Pymunk
for terreno in terrenos:
    create_static_body_from_wkt(space, terreno[0])
# ... (similar para os rios)

# Resto do código do jogo (como no exemplo anterior)

# Funções auxiliares
def create_static_body(space, pos, size):
    body = pymunk.Body(body_type=pymunk.Body.STATIC)
    body.position = pos
    shape = pymunk.Poly.create(body, size)
    space.add(body, shape)
    return shape

# Criar o terreno e o rio
ground = create_static_body(space, (400, 600), [(0, -10), (800, -10)])
river = create_static_body(space, (400, 300), [(-200, -20), (200, -20)])

# Criar o jogador
mass = 1
radius = 15
moment = pymunk.moment_for_circle(mass, 0, radius)
body = pymunk.Body(mass, moment)
body.position = (100, 300)
shape = pymunk.Circle(body, radius)
space.add(body, shape) 

player = shape

# Criar o perseguidor
# ... (similar ao jogador, mas com um comportamento diferente)

# Loop principal
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Controlar o jogador (exemplo: teclas seta)
    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT]:
        body.apply_impulse_at_local_point((-100, 0), (0, 0))
    if keys[pygame.K_RIGHT]:
        body.apply_impulse_at_local_point((100, 0), (0, 0))

    # Atualizar o espaço físico
    space.step(1/60.0)

    # Desenhar
    screen.fill((255, 255, 255))
    space.debug_draw(draw_options)
    pygame.display.flip()
    clock.tick(60)

pygame.quit()