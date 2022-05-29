# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amiguez <amiguez@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/09 06:10:49 by amiguez           #+#    #+#              #
#    Updated: 2022/05/29 07:04:45 by amiguez          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libft.a
# **************************************************************************** #
LST_SRCS := ft_atoi.c\
			ft_bzero.c\
			ft_calloc.c\
			ft_isalnum.c\
			ft_isalpha.c\
			ft_isascii.c\
			ft_isdigit.c\
			ft_isprint.c\
			ft_itoa.c\
			ft_memchr.c\
			ft_memcmp.c\
			ft_memcpy.c\
			ft_memmove.c\
			ft_memset.c\
			ft_putchar_fd.c\
			ft_putendl_fd.c\
			ft_putnbr_fd.c\
			ft_putstr_fd.c\
			ft_split.c\
			ft_strchr.c\
			ft_strdup.c\
			ft_striteri.c\
			ft_strjoin.c\
			ft_strlcat.c\
			ft_strlcpy.c\
			ft_strlen.c\
			ft_strmapi.c\
			ft_strncmp.c\
			ft_strnstr.c\
			ft_strrchr.c\
			ft_strtrim.c\
			ft_substr.c\
			ft_tolower.c\
			ft_toupper.c\
			ft_lstadd_front.c\
			ft_lstadd_back.c\
			ft_lstsize.c\
			ft_lstlast.c\
			ft_lstdelone.c\
			ft_lstclear.c\
			ft_lstiter.c\
			ft_lstmap.c\
			ft_lstnew.c\
			get_next_line_utils.c\
			get_next_line.c\
			ft_printf_p.c\
			ft_printf_x.c\
			ft_printf.c
LST_OBJS :=	$(LST_SRCS:.c=.o)
LST_INCS :=	libft.h
# **************************************************************************** #
DIR_SRC :=	srcs
DIR_OBJ :=	.objs
DIR_INC :=	includes
# **************************************************************************** #
SRCS	:=	$(addprefix $(DIR_SRC)/,$(LST_SRCS))
OBJS	:=	$(addprefix $(DIR_OBJ)/,$(LST_OBJS))
INCS	:=	$(addprefix $(DIR_INC)/,$(LST_INCS))
# **************************************************************************** #
ERASE	=	\033[2K\r
GREY	=	\033[30m
RED		=	\033[31m
GREEN	=	\033[32m
YELLOW	=	\033[33m
BLUE	=	\033[34m
PINK	=	\033[35m
CYAN	=	\033[36m
WHITE	=	\033[37m
BOLD	=	\033[1m
UNDER	=	\033[4m
SUR		=	\033[7m
END		=	\033[0m
# **************************************************************************** #
NORMITEST = 
NORMINETTE = $(shell norminette $(SRCS) | grep -i 'Error')
# **************************************************************************** #
# /////////////////////////////////
CC		:= gcc
CFLAGS	:= -Wall -Werror -Wextra
AR		:= ar rcs
# /////////////////////////////////

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)
	printf "$(ERASE)Compiling Libft : $(GREEN) Done $(END)\n"

ifeq ($(NORMINETTE),$(NORMITEST))
	printf "$(GREEN)Everything is ok\n$(END)"
else
	printf "$(RED)$(SUR)THERE IS AN ERROR WITH NORMINETTE IN LIBFT FILES !!$(END)\n"
endif

$(DIR_OBJ)/%.o: $(DIR_SRC)/%.c $(INCS) Makefile | $(DIR_OBJ)
	$(CC) $(CFLAGS) -I $(DIR_INC) -c $< -o $@
	printf "$(ERASE)Compiling $(NAME) : $(BLUE) $<$(END)"

$(DIR_OBJ):
	mkdir -p $(DIR_OBJ)

# /////////////////////////////////

clean	:
	rm -rf $(DIR_OBJ)
	printf "$(CYAN) /!\ $(END)Erasing .o in libft$(CYAN) /!\ \n$(END)"

fclean	: clean
	rm -rf $(NAME)
	printf "$(RED) /!\ $(END)Erasing libft.a$(RED) /!\ \n$(END)"
re		: fclean all

# /////////////////////////////////

.PHONY	: all clean fclean re 
.SILENT	: