`function main(require){
	if(typeof window !== "undefined"){
		var bs,jq,standart;
		jq=require("jquery");
		standart=require("sn");
		bs=require("bootstrap");
		$(function(){
			$("#sn").sn();
		});
	}
}`
