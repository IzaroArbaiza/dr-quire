# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iarbaiza <iarbaiza@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/27 11:17:54 by iarbaiza          #+#    #+#              #
#    Updated: 2026/04/28 16:47:57 by iarbaiza         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C = Colleen/Colleen
NAME_G = Grace/Grace
NAME_S = Sully/Sully

SRC_C = Colleen/Colleen.s
SRC_G = Grace/Grace.s
SRC_S = Sully/Sully.s

OBJ_C = $(SRC_C:.s=.o)
OBJ_G = $(SRC_G:.s=.o)
OBJ_S = $(SRC_S:.s=.o)

TEST_C = Colleen/test_c.s

NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -no-pie

all: $(NAME_C) $(NAME_G) $(NAME_S)

#--Colleen--
$(NAME_C): $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -o $(NAME_C)
$(NAME_G): $(OBJ_G)
	@$(CC) $(CFLAGS) $(OBJ_G) -o $(NAME_G)
$(NAME_S): $(OBJ_S)
	@$(CC) $(CFLAGS) $(OBJ_S) -o $(NAME_S)

test_colleen: $(NAME_C)
	@./$(NAME_C) > $(TEST_C)
	@diff $(SRC_C) $(TEST_C) && echo "[OK] Both are exactly the same."
#diff -b Colleen.s test_s.s
test_grace: $(NAME_G)
	@./$(NAME_G)
	@diff $(SRC_G) Grace_kid.s && echo "[OK] Both are exactly the same."
test_sully: $(NAME_S)
	@./$(NAME_S)
	@diff $(SRC_S) Sully/Sully_4.s && echo "[OK] Both are exactly the same."

%.o: %.s
	@$(NASM) $(NASMFLAGS) $< -o $@

clean: 
	@rm -f $(OBJ_C) $(OBJ_G) $(OBJ_S)
	@echo "Object files removed."

fclean: clean
	@rm -f $(NAME_C) $(NAME_G) $(NAME_S)
	@rm -f $(TEST_C) Grace_kid.s Sully/Sully_*.s
	@echo "All binaries and generated files removed."

re: fclean all

.PHONY: all clean fclean re test_colleen test_grace test_sully