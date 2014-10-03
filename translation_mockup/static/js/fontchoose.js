$(function() {
    var aFontsSizeArray = new Array('5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '24', '26', '28', '30', '33', '36', '39', '42', '45', '48', '55', '65', '75', '85', '95', '110', '130', '150');
    $('#slider').slider({
        value: 7,
        min: 1,
        max: 35,
        step: 1,
        slide: function(event, ui) {
            
            console.log(ui.value);

            var sFontSizeArray = aFontsSizeArray[ui.value];
            $('#source_grading_box').css('font-size', sFontSizeArray + 'px' );
            $('#target_grading_box').css('font-size', sFontSizeArray + 'px' );
        }
    });
    $('#font_size').val((aFontsSizeArray[$('#slider').slider('value')]) + ' px');
});