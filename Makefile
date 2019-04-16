# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thdelmas <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/16 17:21:54 by thdelmas          #+#    #+#              #
#    Updated: 2019/04/17 00:09:05 by thdelmas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
PROJECT = LIBFT

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
GREEN = \033[1m\033[32m
WRED = \033[96;41m
WBLUE = \033[31;44m
YELLOW = \033[33m
CLEAR = \033[0;0m

### Phony ###
.PHONY: all, clean, fclean, re, so, hey, compil

### Rules ###
all: hey $(OBJ_DIR) $(NAME)
	@printf "$(WBLUE)\t- THDELMAS -\t$(CLEAR)\n"

### Mkdir obj ###
$(OBJ_DIR):
	@printf "$(WRED)\t- - MKDIR $(OBJ_DIR) -  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	mkdir -p $(OBJ_DIR)
	@printf "$(CLEAR)"

### Compilation ###
$(OBJ_DIR)/%.o: compil $(SRC_DIR)/%.c
	@printf "$(GREEN)"
	$(CC) $(CFLAGS) -I $(INC_DIR) -o $@ -c $(SRC_DIR)/$(patsubst %.o,%.c,$(@F))
	@printf "$(CLEAR)"

### Link ###
$(NAME): $(OBJ) $(INC)
	@printf "$(WRED)\t-  - LINK -  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)
	@printf "$(CLEAR)"

### Linux ###
so:
	@printf "$(WRED)\t-  - LINUX -  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	cc -shared -o $(patsubst %.a, %.so, $(NAME)) -fPIC $(FILES)
	@printf "$(CLEAR)"

### Clean ###
clean:
	@printf "$(WRED)\t-  - CLEAN -  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	rm -rf $(OBJ_DIR)
	@printf "$(CLEAR)"

fclean: clean
	@printf "$(WRED)\t-  - FCLEAN -  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	rm -rf $(NAME)
	@printf "$(CLEAR)"

re: hey fclean all

### Tools ###
hey:
	@printf "$(WBLUE)\t-  - $(PROJECT) -  - \t$(CLEAR)\n"

compil:
	@printf "$(WRED)\t-  - COMPIL -  -\t$(CLEAR)\n"

### git-autosave ###
gitsave: hey fclean
	@printf "$(WBLUE)\t-  - GIT SAVE FOR YOU	-  -\t$(CLEAR)\n"
	@printf "$(WRED)\t-  - SRC INCLUDES LIBFT MAKEFILE	-  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	@git add .
	@printf "GIT AUTO-SAVE !"
	@sleep 0.5
	@git commit -m "auto-save"
	@printf "$(CLEAR)"
	@git push

### Norminette ###
norm:
	@printf "$(WRED)\t-  - NORM 42	-  -\t$(CLEAR)\n"
	@printf "$(WRED)\t-  - SRC INCLUDES LIBFT MAKEFILE	-  -\t$(CLEAR)\n"
	@printf "$(GREEN)"
	@norminette -R CheckForbiddenSourceHeader $(HEADER) $(SRC_NAME)
	@printf "$(CLEAR)"
