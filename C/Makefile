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
NAME_S = Sully/Sully

SRC_C = Colleen/Colleen.c
SRC_G = Grace/Grace.c
SRC_S = Sully/Sully.c

OBJ_C = $(SRC_C:.c=.o)
OBJ_G = $(SRC_G:.c=.o)
OBJ_S = $(SRC_S:.c=.o)

TEST_C = Colleen/test_c.c

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME_C) $(NAME_G) $(NAME_S)

#--Colleen--
$(NAME_C): $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -o $(NAME_C)
	@echo "[OK] $(NAME_C) compiled successfully."

test_colleen: $(NAME_C)
	@./$(NAME_C) > $(TEST_C)
	@diff $(SRC_C) $(TEST_C)
	@echo "[OK] Both "
#diff -b Colleen.c test_s.c
#sed -i 's/\r//' Colleen/Colleen.c	#Character CR (carriage return), used by Windows

#--Grace--
$(NAME_G): $(OBJ_G)
	@$(CC) $(CFLAGS) $(OBJ_G) -o $(NAME_G)
	@echo "[OK] $(NAME_G) compiled successfully."

test_grace: $(NAME_G)
	@./$(NAME_G)
	@diff $(SRC_G) Grace/Grace_kid.c
	@echo "[OK] $(NAME_G) replicated successfully!"

#--Sully--
$(NAME_S): $(OBJ_S)
	@$(CC) $(CFLAGS) $(OBJ_S) -o $(NAME_S)
	@echo "[OK] $(NAME_S) compiled successfully."

test_sully: $(NAME_S)
	@./$(NAME_S)
	@diff Sully/Sully.c Sully/Sully_4.c
#ls -al | grep Sully | wc -l

clean:
	@rm -f $(OBJ_C) $(OBJ_G) $(OBJ_S)
	@echo "Object files removed."

fclean: clean
	@rm -f $(NAME_C) $(NAME_G) $(NAME_S)
	@rm -f $(TEST_C) Grace/Grace_kid.c
	@rm -f Sully/Sully_*
	@echo "All binaries and generated files removed."

re: fclean all

.PHONY: all clean fclean re test_colleen test_grace test_sully