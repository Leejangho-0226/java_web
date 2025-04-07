package pack.board;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardBean {
	private String name, pass, mail, title, cont, bip, bdate;
	private int num, readcnt, gnum, onum, nested;
	
	public void setBdate() { // 오버로딩
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int day = now.getDayOfMonth();
		this.bdate = year + "-" + month + "-" + day;

	}
}
