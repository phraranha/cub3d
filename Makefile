NAME = cub3D
NAME_BONUS = cub3D_bonus
LIBS_FOLDER = ./lib
LIBMLX = $(LIBS_FOLDER)/MLX42
LIBFT = $(LIBS_FOLDER)/libft
HEADERS = ./includes/cub3d.h

CC = clang
FLAGS = -Wextra -Wall -Werror
FLAGSOMLX = -Wunreachable-code -Ofast
LIBS = $(LIBMLX)/build/libmlx42.a $(LIBFT)/libft.a
FLAGSMLX = -ldl -lglfw -pthread -lm

# SRC = ./src/main.c ./src/init_game.c ./src/finish_game.c ./src/draw.c ./src/vector.c ./src/walls.c
SRC_FILE = main vector \
	$(addprefix game/, init_game init_utils finish_game hooks) \
	$(addprefix graphic/, draw draw_utils walls walls_utils dda_functions dda_utils) \
	$(addprefix movements/, movements) \
	$(addprefix parser/, args args_utils color color_utils flood_fill getter map map_utils textures utils) \
	$(addprefix parser/, validate_map validate_map_utils freerror freerror_utils)

SRC = $(addsuffix .c, $(addprefix ./src/, $(SRC_FILE)))

SRC_BONUS = ./src_bonus/main_bonus.c

INCLUDES = -I includes -I $(LIBMLX)/include -I $(LIBFT)/ -I $(LIBFT)/gnl/includes -I $(LIBFT)/ft_printf/includes
OBJS = ${SRC:%.c=%.o}
OBJS_BONUS = ${SRC_BONUS:%.c=%.o}

all: libmlx libft $(NAME)
	@echo "Concluido!"

bonus: libmlx libft $(NAME_BONUS)

libmlx:
	@echo "Compilando lib gráfica..."
	@cmake $(LIBMLX) -B $(LIBMLX)/build && make -C $(LIBMLX)/build -j4 --no-print-directory

libft:
	@echo "Compilando Libft..."
	@make all bonus new_fun -C $(LIBFT) $(FLAGS) --no-print-directory

%.o: %.c $(HEADERS)
	@$(CC) $(FLAGS) $(FLAGSOMLX) -o $@ -c $< && echo "Compilando: $(notdir $<)"

$(NAME): $(OBJS)
	@echo "Criando arquivo $(NAME)"
	@$(CC) $(OBJS) $(LIBS) $(INCLUDES) -o $(NAME) $(FLAGSMLX)

$(NAME_BONUS): $(OBJS_BONUS)
	@echo "Criando arquivo $(NAME)"
	@$(CC) $(OBJS_BONUS) $(LIBS) $(INCLUDES) -o $(NAME_BONUS) $(FLAGSMLX)

clean:
	@echo "Limpando objects..."
	@rm -rf $(OBJS) $(OBJS_BONUS)
	@make clean -C $(LIBFT) --no-print-directory
	@echo "Limpando build..."
	@rm -rf $(LIBMLX)/build
	@echo "Feito!"


fclean: clean
	@echo "Removendo libft.a..."
	@make fclean -C $(LIBFT) --no-print-directory
	@echo "Removendo executável..."
	@rm -rf $(NAME) $(NAME_BONUS)
	@echo "Feito!"

re: fclean all

.PHONY: all, clean, fclean, re, libmlx
