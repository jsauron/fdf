# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jsauron <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/06/29 23:58:29 by jsauron           #+#    #+#              #
#    Updated: 2018/08/11 21:35:47 by jsauron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
 NAME = fdf

 SRCS_DIR = srcs/

 SRC = srcs/main.c \
	srcs/matrice.c \
	srcs/calc_matrice.c \
	srcs/hook.c \
	srcs/parsing.c \
	srcs/drawing.c \
	srcs/error.c \
	srcs/image.c \
	srcs/tools.c \
	srcs/color.c \
	srcs/init.c

OBJS = $(SRC:.c=.o)

INCLUDES = includes/

MLX = -L ./minilibx_macos -lmlx -framework OpenGL -framework AppKit

DONE = "\033[35m FDF DISPLAY MAP\033[0m"

all: lib $(NAME)

$(NAME):$(OBJS)
	@gcc  -Wall -Wextra -Werror -o $(NAME) libft/libft.a $(OBJS) -I $(INCLUDES) $(MLX)
	@echo $(DONE)

lib:
	@make -j -C libft/ libft.a

%.o: %.c $(INCLUDES)fdf.h
	@gcc -Wall -Wextra -Werror -o $@ -c $<

clean:
	@rm -f $(OBJS) && make -C libft/ clean

fclean: clean
	@rm -f $(NAME) && make -C libft/ fclean

re: fclean 
	@$(MAKE)
.PHONY: all clean fclean re 
