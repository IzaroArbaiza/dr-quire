public class Colleen {
	/*
		Colleen - a simple quine that prints itself.
	*/

	public static void print_source() {
		String src = "public class Colleen {%c%c/*%c%c%cColleen - a simple quine that prints itself.%c%c*/%c%c%cpublic static void print_source() {%c%c%cString src = %c%s%c;%c%c%cSystem.out.printf(src, 10, 9, 10, 9, 9, 10, 9, 10, 10, 9, 10, 9, 9, 34, src, 34, 10, 9, 9, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10);%c%c}%c%c%cpublic static void main(String[] args) {%c%c%c//Main that calls print_source.%c%c%cprint_source();%c%c}%c}%c";
		System.out.printf(src, 10, 9, 10, 9, 9, 10, 9, 10, 10, 9, 10, 9, 9, 34, src, 34, 10, 9, 9, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 10);
	}

	public static void main(String[] args) {
		//Main that calls print_source.
		print_source();
	}
}
