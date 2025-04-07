package pack;

public class Jspex11FormBean {
	// 클라이언트로 부터 수신되는 값이 복수일 경우 이를 한꺼번에 처리하기 위한 클래스 즉, 폼빈을 생성 가능
	// 생성 조건 : 클라이언트의 querystring(?변수=값&변수=값..)에서 사용하는 매개변수명과 멤버필드의 이름은 일치 시킨다
	private String name;
	private int kor;
	private int eng;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getKor() {
		return kor;
	}
	
	public void setKor(int kor) {
		this.kor = kor;
	}
	
	public int getEng() {
		return eng;
	}
	
	public void setEng(int eng) {
		this.eng = eng;
	}
}
