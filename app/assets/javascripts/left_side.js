$(document).ready(function(){
    
    $(".showMore").click(function(){
        
       
       
        
        var divId = "#collapse".concat(this.id);
        
         alert(divId);
        $(divId).html("<%= render partial: 'points/point2', collection: point.points.order(:votes_count).take(2), locals: {side: side, debate: debate} %>");

        
    })
    
})