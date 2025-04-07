package pack;

public class Jspex11Logic {
	// 총점과 평균 등을 계산하는 business logic용 클래스
	private Jspex11FormBean formBean;
	
	public void setFormBean(Jspex11FormBean formBean) {
		this.formBean = formBean;
	}
	
	public int getTot() {
		return formBean.getKor() + formBean.getEng();
	}
	
	public double getAvg() {
		double imsi = getTot() / 2.0;
		return imsi;
	}
}
