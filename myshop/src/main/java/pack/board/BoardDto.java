package pack.board;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDto {
	private String name, pass, mail, title, cont, bip, bdate;
	private int num, readcnt, gnum, onum, nested;
	
}

