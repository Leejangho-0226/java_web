/**
 module : js 코드를 담고 있는 파일. 변수, 명령문, 함수, 클래스의 집합체 
다른 javascript 파일에서 현재 javascript 문서의 멤버가 필요하면 export한다
 */
// 변수 내 보내기
export let user = "홍길동";

// json 형식으로 내 보내기
const name = "apple";
const price = "1000";
export let msg = {name,price};

// 함수
export function sayHi(user){
	return `Hello, ${user}`;
}

export default "하나의 값을 지정하고 그 값을 다른 모듈에서 사용";

// 배열
export let datas = ["커피", "맥주", "콜라"];

// 함수 복수로 내 보내기
function f1(ir){
	return `안녕	${ir}`;
}
function f2(ir){
	return `반가워 ${ir}`;
}
export {f1,f2};





