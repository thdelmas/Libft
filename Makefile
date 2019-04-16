# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thdelmas <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/16 17:21:54 by thdelmas          #+#    #+#              #
#    Updated: 2019/04/16 18:03:42 by thdelmas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

### Directories ###
SRC_DIR = .
INC_DIR = .
OBJ_DIR = ./obj

###  CC && FLAGS ###
CC = clang
CFLAGS = -Wall -Werror -Wextra -I. -c

### FILES ###
C_FILES = ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c \
		  ft_memchr.c ft_memcmp.c ft_strlen.c ft_strdup.c ft_strndup.c \
		  ft_strcpy.c ft_strncpy.c ft_strcat.c ft_strncat.c ft_strlcat.c \
		  ft_strchr.c ft_strrchr.c ft_strstr.c ft_strnstr.c ft_strcmp.c \
		  ft_strncmp.c ft_atoi.c ft_isalpha.c ft_isdigit.c ft_isalnum.c \
		  ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_memalloc.c \
		  ft_memdel.c ft_strnew.c ft_strdel.c ft_strclr.c ft_striter.c \
		  ft_striteri.c ft_strmap.c ft_strmapi.c ft_strequ.c ft_strnequ.c \
		  ft_strsub.c ft_strjoin.c ft_strtrim.c ft_strsplit.c ft_itoa.c \
		  ft_putchar.c ft_putchar_fd.c ft_putstr.c ft_putstr_fd.c \
		  ft_putendl.c ft_putendl_fd.c ft_putnbr.c ft_putnbr_fd.c \
		  ft_lstnew.c ft_lstdelone.c ft_lstdel.c ft_lstadd.c ft_lstiter.c \
		  ft_is_prime.c ft_sqrt.c ft_power.c ft_str_dupsize.c ft_factorial.c \
		  ft_joinfree.c ft_lstmap.c

O_FILES = $(C_FILES:%.c=%.o)

H_FILES = libft.h \

### Full Paths ###
SRC = $(addprefix $(SRC_DIR)/,$(C_FILES))
OBJ = $(addprefix $(OBJ_DIR)/,$(O_FILES))
INC = $(addprefix $(INC_DIR)/,$(H_FILES))

### Colors ###
WHITE = \033[0m
CYAN = \033[36m
GREEN = \033[32m
BOLDRED = \033[1m\033[31m
YELLOW = \033[33m
OVERRIDE = \033[K

### Phony ###
.PHONY: all, clean, fclean, re

### Rules ###
all: hey $(OBJ_DIR) $(FT_LIB) $(MLX_LIB) $(NAME)

### Mkdir obj ###
$(OBJ_DIR):
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - MKDIR $(OBJ_DIR) -  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(GREEN)"
	mkdir -p $(OBJ_DIR)
	@printf "$(OVERRIDE)"

### Compilation ###
$(OBJ_DIR)/%.o: compil $(SRC_DIR)/%.c
	@printf "$(GREEN)"
	$(CC) $(CFLAGS) -I $(INC_DIR) -o $@ -c $(patsubst %.o,%.c,$(patsubst %$(OBJ_DIR),%$(SRC_DIR),$(@)))
	@printf "$(OVERRIDE)"


### Link ###
$(NAME): $(OBJ) $(INC)
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - LINK -  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(GREEN)"
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)
	@printf "$(OVERRIDE)"

### Linux ###
so:
	cc -shared -o libft.so -fPIC $(FILES)

### Clean ###
clean:
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - CLEAN -  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(GREEN)"
	rm -rf $(OBJ_DIR)
	@printf "$(OVERRIDE)"

fclean: clean
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - FCLEAN -  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(GREEN)"
	rm -rf $(NAME)
	@printf "$(OVERRIDE)"

re: hey fclean all

### Tools ###
hey:
	@printf "$(BOLDRED)\n---------  $(GREEN)- thdelmas - $(CYAN)LIBFT - $(BOLDRED)  ---------\n$(OVERRIDE)\n"

compil:
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - COMPIL -  - $(BOLDRED)  ---------$(OVERRIDE)\n"

### git-autosave ###
gitsave: fclean
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - GIT SAVE FOR YOU	-  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - SRC INCLUDES LIBFT MAKEFILE	-  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(GREEN)"
	@git add .
	@printf "GIT AUTO-SAVE !"
	@sleep 0.5
	@git commit -m "auto-save"
	@git push
	@printf "$(OVERRIDE)"

### Norminette ###
norm:
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - NORM 42	-  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(BOLDRED)\n---------  $(CYAN) -  - SRC INCLUDES LIBFT MAKEFILE	-  - $(BOLDRED)  ---------$(OVERRIDE)\n"
	@printf "$(GREEN)"
	@norminette -R CheckForbiddenSourceHeader $(HEADER) $(SRC_NAME)
	@printf "$(OVERRIDE)"
