import java.io.*;

public class Grace {
	/*
		Grace - self-replicating program using macros (constants/static) only.
	*/
	public static final String FILE_NAME = "Grace_kid.java";
	public static final String CODE = "import java.io.*;%c%cpublic class Grace {%c%c/*%c%c%cGrace - self-replicating program using macros (constants/static) only.%c%c*/%c%cpublic static final String FILE_NAME = %cGrace_kid.java%c;%c%cpublic static final String CODE = %c%s%c;%c%cstatic {%c%c%ctry (FileWriter f = new FileWriter(FILE_NAME)) {%c%c%c%cf.write(String.format(CODE, 10, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 34, 34, 10, 9, 34, CODE, 34, 10, 9, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 10, 9, 10, 9, 10, 10));%c%c%c} catch (IOException e) {}%c%c}%c%cpublic static void main(String[] args) {}%c}%c";
	static {
		try (FileWriter f = new FileWriter(FILE_NAME)) {
			f.write(String.format(CODE, 10, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 34, 34, 10, 9, 34, CODE, 34, 10, 9, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 10, 9, 10, 9, 10, 10));
		} catch (IOException e) {}
	}
	public static void main(String[] args) {}
}
