
$(document).ready(function(){
    

 
    $("#test123").prop("disabled",false);
    
  
    $("#leftShow").click(function(){

        var prevDivs = countShown();
        $("#leftSide").toggle();
        reSizeDivs(prevDivs);
        toggleOpacity($(this));
        
        
        
    })
    
     $("#neutralShow").click(function(){
        
        var prevDivs = countShown();
        $("#neutralSide").toggle();
        reSizeDivs(prevDivs);
         toggleOpacity($(this));
        
    })

    
    $("#rightShow").click(function(){
        
        
        var prevDivs = countShown();
        $("#rightSide").toggle();
        reSizeDivs(prevDivs);
         toggleOpacity($(this));
        
    })
    
    $("#1").click(function(){
        
        
        alert("expand");
    })
    
  
});

function countShown(){
    
    var divs =0;
    
    if ($("#leftSide").css("display")!="none"){
        
       
        divs ++;
        
    }
    
    if ($("#neutralSide").css("display")!="none"){
        
        divs ++;
        
    }
    
    if ($("#rightSide").css("display")!="none"){
        
        divs ++;
        
    }
  
    return divs;
    
    
}

function reSizeDivs(prevDivs){
    
    
   
    var oldSize = 12/prevDivs;
    var newSize = 12/(countShown());
    
    var prevClass = "col-sm-".concat(oldSize);
    var newClass = "col-sm-".concat(newSize);
    
    var classes = prevClass.concat(" ").concat(newClass);
    
    
   
  //  $("#leftSide").switchClass(prevClass, newClass, 300) 
  


  
    $("#neutralSide").toggleClass(classes, 300);
    $("#leftSide").toggleClass(classes, 300);
    $("#rightSide").toggleClass(classes, 300);

    

 //   $("#rightSide").switchClass(prevClass, newClass, 300) 
    
   
}


function toggleOpacity(selector){

        if(selector.css('opacity')==1){
            
            selector.css('opacity',.3)
            
            
        }
        
        else{
            
             selector.css('opacity',1)
            
        }
    
    
}