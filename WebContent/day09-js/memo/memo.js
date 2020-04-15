$(function(){
	// 메모 추가번튼 클릭시 화면에 메모를 보여주기 / id : createBtn
	$("#createBtn").click(function(){
		new Memo().create();		
	});
});

function Memo(){
	this.$note = null;
}
// create()
Memo.prototype.create = function() {
	console.log("create")
	var $note = $(
		`<div class="memo-note">
			<!-- bar -->
			<div class="memo-bar">
				<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
				<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
			</div>
			<!-- content -->
			<div class="memo-edit">
				<textarea class="memo-edit-area"></textarea>
			</div>
		</div>`
	);
	
	$note.appendTo($(".memo-area"));
	this.$note = $note;
	this.drag();
	
	var that = this;
	$note.find(".glyphicon-chevron-up").click(function(){
		that.display();
	});
	$note.find(".glyphicon-pushpin").click(function(){
		that.fix();
	});
	$note.find(".glyphicon-trash").click(function(){
		that.del();
	});
}
// drag()
Memo.prototype.drag = function() {
	this.$note.draggable();
}
// display()
Memo.prototype.display = function() {
	this.$note.toggleClass("h20");
}
// fix()
Memo.prototype.fix = function() {
	this.$note.find(".glyphicon-pushpin").toggleClass("choice");
	if(this.$note.find(".glyphicon-pushpin").hasClass("choice")){
		this.$note.draggable("disable");
	}else{
		this.$note.draggable("enable");
	}
	
}
// del()
Memo.prototype.del = function() {
	this.$note.remove();
}