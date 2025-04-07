package pack;

public class Jspex12Logic {
	private Jspex12TestBean formBean;
	
	public void setFormBean(Jspex12TestBean formBean) {
		this.formBean = formBean;
		
	}
	
	public int setaoa() {
		return formBean.getJung() - formBean.getHal();
	}
	
	
}
