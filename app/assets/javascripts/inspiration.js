function chooseTripPlan (){
	var form = $('#choose_inspiration.form-float');
	var blurBackground = addBlur('body');
	form = $('<%= j render "templates/choose_inspiration" %>');
	slideDownShow(form);
	clickToClose(blurBackground.add('.close'), form);
}