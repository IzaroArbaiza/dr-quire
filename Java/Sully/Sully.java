import java.io.*;

public class Sully {
	public static void main(String[] args) {
		int i = 5;
		int x = i - 1;
		String code = "import java.io.*;%c%cpublic class Sully_%d {%c%cpublic static void main(String[] args) {%c%c%cint i = %d;%c%c%cint x = i - 1;%c%c%cString code = %c%s%c;%c%c%c%cif (i < 0)%c%c%c%creturn;%c%c%cString filename = %cSully_%c + i + %c.java%c;%c%c%c%ctry (FileWriter f = new FileWriter(filename)) {%c%c%c%cf.write(String.format(code, 10, 10, i, 10, 9, 10, 9, 9, x, 10, 9, 9, 10, 9, 9, 34, code, 34, 10, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 34, 34, 34, 34, 10, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 10, 9, 9, 10, 9, 9, 9, 34, 34, 10, 9, 9, 9, 34, 34, 34, 34, 10, 9, 9, 10, 9, 10, 10));%c%c%c} catch (IOException e) {}%c%c%ctry {%c%c%c%cRuntime.getRuntime().exec(new String[]{%cjavac%c, filename}).waitFor();%c%c%c%cRuntime.getRuntime().exec(new String[]{%cjava%c, %cSully_%c + i}).waitFor();%c%c%c} catch (Exception e) {}%c%c}%c}%c";

		if (i < 0)
			return;
		String filename = "Sully_" + i + ".java";

		try (FileWriter f = new FileWriter(filename)) {
			f.write(String.format(code, 10, 10, i, 10, 9, 10, 9, 9, x, 10, 9, 9, 10, 9, 9, 34, code, 34, 10, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 34, 34, 34, 34, 10, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 10, 9, 9, 10, 9, 9, 9, 34, 34, 10, 9, 9, 9, 34, 34, 34, 34, 10, 9, 9, 10, 9, 10, 10));
		} catch (IOException e) {}
		try {
			Runtime.getRuntime().exec(new String[]{"javac", filename}).waitFor();
			Runtime.getRuntime().exec(new String[]{"java", "Sully_" + i}).waitFor();
		} catch (Exception e) {}
	}
}
