# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thdelmas <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/02/24 16:49:40 by thdelmas          #+#    #+#              #
#    Updated: 2019/03/24 19:51:29 by thdelmas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	libft.a
CFLAGS = -Wall -Werror -Wextra -I. -c
FILES =	\
ft_memset.c			\
ft_bzero.c			\
ft_memcpy.c			\
ft_memccpy.c		\
ft_memmove.c		\
ft_memchr.c			\
ft_memcmp.c			\
ft_strlen.c			\
ft_strdup.c			\
ft_strndup.c		\
ft_strcpy.c			\
ft_strncpy.c		\
ft_strcat.c			\
ft_strncat.c		\
ft_strlcat.c		\
ft_strchr.c			\
ft_strrchr.c		\
ft_strstr.c			\
ft_strnstr.c		\
ft_strcmp.c			\
ft_strncmp.c		\
ft_atoi.c			\
ft_isalpha.c		\
ft_isdigit.c		\
ft_isalnum.c		\
ft_isascii.c		\
ft_isprint.c		\
ft_toupper.c		\
ft_tolower.c		\
ft_memalloc.c		\
ft_memdel.c			\
ft_strnew.c			\
ft_strdel.c			\
ft_strclr.c			\
ft_striter.c		\
ft_striteri.c		\
ft_strmap.c			\
ft_strmapi.c		\
ft_strequ.c			\
ft_strnequ.c		\
ft_strsub.c			\
ft_strjoin.c		\
ft_strtrim.c		\
ft_strsplit.c		\
ft_itoa.c			\
ft_putchar.c		\
ft_putchar_fd.c		\
ft_putstr.c			\
ft_putstr_fd.c		\
ft_putendl.c		\
ft_putendl_fd.c		\
ft_putnbr.c			\
ft_putnbr_fd.c		\
ft_lstnew.c			\
ft_lstdelone.c		\
ft_lstdel.c			\
ft_lstadd.c			\
ft_lstiter.c		\
ft_is_prime.c		\
ft_sqrt.c			\
ft_power.c			\
ft_str_dupsize.c	\
ft_factorial.c		\
ft_lstmap.c

OBJ= $(subst .c,.o, $(FILES))

all: $(NAME)

$(NAME): $(OBJ) libft.h
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

# This won't run if the source files don't exist or are not modified
$(OBJ):

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: clean fclean all re
