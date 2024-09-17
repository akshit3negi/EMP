package util_class;

public class test {

	public static void main(String[] args) {
		String pwd = "My2@Pass";
		String hashpass = BCrypt.hashpw(pwd, BCrypt.gensalt(12));
		System.out.println(hashpass.length() + " -> " + hashpass);
		System.out.println(BCrypt.checkpw(pwd, hashpass));
	}

}
