# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iarbaiza <iarbaiza@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/27 11:17:54 by iarbaiza          #+#    #+#              #
#    Updated: 2026/02/04 17:47:41 by iarbaiza         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C = Colleen/Colleen
#NAME_G = Grace/Grace
#NAME_S = Sully/Sully

SRC_C = Colleen/Colleen.asm
#SRC_G = Grace/Grace.s
#SRC_S = Sully/Sully.s

OBJ_C = $(SRC_C:.asm=.o)
#OBJ_G = $(SRC_G:.s=.o)
#OBJ_S = $(SRC_S:.s=.o)

TEST_C = Colleen/test_c.asm

NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -no-pie

all: $(NAME_C)
#$(NAME_G) $(NAME_S)

#--Colleen--
$(NAME_C): $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -o $(NAME_C)

test_colleen: $(NAME_C)
	@./$(NAME_C) > $(TEST_C)
	@diff $(SRC_C) $(TEST_C) && echo "[OK] Both"
#diff -b Colleen.s test_s.s

%.o: %.asm
#error aquí abajo (no compila bien)
	@$(NASM) $(NASMFLAGS) $< -o $@

clean: 
	@rm -f $(OBJ_C)
	@echo "Object files removed."

fclean: clean
	@rm -f $(NAME_C) 
	@rm -f $(TEST_C) 
	@echo "All binaries and generated files removed."

re: fclean all

.PHONY: all clean fclean re test_colleen