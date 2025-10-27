# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iarbaiza <iarbaiza@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/24 11:50:35 by iarbaiza          #+#    #+#              #
#    Updated: 2025/10/24 11:50:35 by iarbaiza         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C = Colleen/Colleen
NAME_G = Grace/Grace
#NAME_S = Sully/Sully

SRC_C = Colleen/Colleen.c
SRC_G = Grace/Grace.c
#SRC_S = Sully/Sully.c

OBJ_C = $(SRC_C:.c=.o)
OBJ_G = $(SRC_G:.c=.o)
#OBJ_S = $(SRC_S:.c=.o)

TEST_C = Colleen/test_c.c
# TEST_S = Sully/test.c

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME_C) $(NAME_G)

#--Colleen--
$(NAME_C): $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -o $(NAME_C)
	@echo "[OK] $(NAME_C) compiled successfully."

test_colleen: $(NAME_C)
	@./$(NAME_C) > $(TEST_C)
	@diff $(SRC_C) $(TEST_C)
	@echo "[OK] Both "
#diff -b Colleen.c test_s.c
#sed -i 's/\r//' Colleen/Colleen.c 

#--Grace--
$(NAME_G): $(OBJ_G)
	@$(CC) $(CFLAGS) $(OBJ_G) -o $(NAME_G)
	@echo "[OK] $(NAME_G) compiled successfully."

test_grace: $(NAME_G)
	@./$(NAME_G)
	@diff $(SRC_G) Grace/Grace_kid.c
	@echo "[OK] Grace replicated successfully!"

clean:
	rm -f $(OBJ_C) $(OBJ_G)

fclean: clean
	rm -f $(NAME_C) $(NAME_G)
	rm -f $(TEST_C) Grace/Grace_kid.c

re: fclean all

Colleen: $(NAME_C)
Grace: $(NAME_G)

.PHONY: all clean fclean re Colleen Grace test_colleen test_grace