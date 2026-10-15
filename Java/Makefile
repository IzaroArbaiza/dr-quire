# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iarbaiza <iarbaiza@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/24 11:50:35 by iarbaiza          #+#    #+#              #
#    Updated: 2026/10/15 14:09:24 by iarbaiza         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_C = Colleen/Colleen.class
NAME_G = Grace/Grace.class
NAME_S = Sully/Sully.class

SRC_C = Colleen/Colleen.java
SRC_G = Grace/Grace.java
SRC_S = Sully/Sully.java

TEST_C = Colleen/tmp_Colleen.java

JC = javac

all: $(NAME_C) $(NAME_G) $(NAME_S)

#--Colleen--
$(NAME_C): $(SRC_C)
	@$(JC) $(SRC_C)
	@echo "[OK] Colleen compiled successfully."

test_colleen: $(NAME_C)
	@java Colleen.Colleen > $(TEST_C)
	@diff $(SRC_C) $(TEST_C) && echo "[OK] Both are exactly the same."

#--Grace--
$(NAME_G): $(SRC_G)
	@$(JC) $(SRC_G)
	@echo "[OK] Grace compiled successfully."

test_grace: $(NAME_G)
	@cd Grace && java Grace
	@diff $(SRC_G) Grace/Grace_kid.java && echo "[OK] Both are exactly the same."

#--Sully--
$(NAME_S): $(SRC_S)
	@$(JC) $(SRC_S)
	@echo "[OK] Sully compiled successfully."

test_sully: $(NAME_S)
	@cd Sully && java Sully
	@cd Sully; mkdir -p tmp && cp Sully.class tmp/ && cd tmp && java Sully ; ls -al | grep Sully | wc -l
	@cd Sully/tmp && diff ../Sully.java Sully_5.java ; diff ../Sully.java Sully_4.java ; diff Sully_5.java Sully_0.java

clean:
	@rm -f $(NAME_C) $(NAME_G) $(NAME_S)
	@echo "Class files removed."

fclean: clean
	@rm -f $(TEST_C) Grace/Grace_kid.java Sully/Sully_*.java Sully/Sully_*.class
	@rm -Rf Sully/tmp
	@echo "All generated files removed."

re: fclean all

.PHONY: all clean fclean re test_colleen test_grace test_sully
