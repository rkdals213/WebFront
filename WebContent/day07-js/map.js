/**
 * MyMap 생성자로 사용될 함수를 구현
 */
function MyMap(){
	this.data = {};
	this.count = 0;
	
}

MyMap.prototype.put = function(property, input){
	this.data[property] = input;
	this.count += 1;
}
MyMap.prototype.size = function(){
	return this.count;
}
MyMap.prototype.get = function(property){
	return this.data[property];
}
MyMap.prototype.remove = function(property){
	delete this.data[property];
	this.count -= 1;
}
MyMap.prototype.clear = function(){
	delete this.data;
	this.count = 0;
}
