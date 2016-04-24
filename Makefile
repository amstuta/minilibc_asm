##
## Makefile for makefile in /home/amstuta/rendu/MinilibC_ASM
##
## Made by arthur
## Login   <amstuta@epitech.net>
##
## Started on  Mon Feb 16 16:23:02 2015 arthur
## Last update Wed Mar 18 13:00:47 2015 arthur
##

ASM		= nasm
ASMFLAGS	= -f elf64
CC		= gcc

RM		= rm -f

SRCS		=	strlen.S \
			strchr.S \
			strstr.S \
			memset.S \
			memcpy.S \
			strcmp.S \
			strncmp.S \
			strcasecmp.S \
			strpbrk.S \
			rindex.S \
			strcspn.S
CSRC		=	tests.c

OBJS		=	$(SRCS:.S=.o)
EOBJS		=	$(CSRC:.c=.o)

NAME		= libasm.so
EXE		= tests

all:		$(NAME) $(EXE)

%.o:		%.S
		$(ASM) $< $(ASMFLAGS) -o $@

$(NAME):	$(OBJS)
		$(CC) -shared -o $(NAME) $(OBJS)

$(EXE):		$(EOBJS)
		$(CC) $(CSRC) -L./ -lasm -o $(EXE)

clean:
		$(RM) $(OBJS) $(EOBJS)

fclean:		clean
		$(RM) $(NAME) $(EXE)

re:		fclean all

.PHONY:		all clean fclean re
