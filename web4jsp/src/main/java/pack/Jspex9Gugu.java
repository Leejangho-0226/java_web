package pack;

public class Jspex9Gugu { // 비즈니스 로직용 클래스. jsp에서 싱글톤패턴이 적용된 포함관계로 호출됨
	// 싱클톤 패턴 코드
	private static Jspex9Gugu gugu = new Jspex9Gugu();
	
	public static Jspex9Gugu getInstance() {
		return gugu;
	}
	
	public Jspex9Gugu() {
		// TODO Auto-generated constructor stub
	}
	
	public int[] computeGugu(int dan) {
		int gu[] = new int[9];
		for(int i=1; i < 10; i++) {
			gu[i - 1] = dan * i;
		}
		return gu;
	}
}
