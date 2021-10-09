# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msousa <mlrcbsousa@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 22:31:25 by msousa            #+#    #+#              #
#    Updated: 2021/04/22 10:44:55 by msousa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CFLAGS	= -Wall -Wextra -Werror
CC			= gcc
RM			= rm -f
AR			= ar rcs
LIBFT		= libft
INC			= -I includes -I ${LIBFT}

NAME		= libftprintf.a

SRCS		= ft_printf.c $(wildcard srcs/*.c)

OBJS		= ${SRCS:.c=.o}

${NAME}: 	${OBJS}
					${MAKE} -C ${LIBFT}
					mv ${LIBFT}/libft.a $@
					${AR} $@ $^

%.o:%.c
					${CC} ${CFLAGS} ${INC} -c $< -o $@

all: 			${NAME}

clean:
					${MAKE} clean -C ${LIBFT}
					${RM} ${OBJS}

fclean: 	clean
					${RM} ${NAME}

re: 			fclean all

.PHONY: 	re clean fclean all
