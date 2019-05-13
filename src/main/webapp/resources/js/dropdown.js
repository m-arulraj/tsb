/**
 * 
 */
$("#categoryId").change(function(){
        var categoryId = $(this).val();
        var option = '';
        $.ajax({
            type: 'GET',
            url: "/tsb/product/"+categoryId,
            success: function(data){
                var slctSubcat=$('#productId'), option="";
                slctSubcat.empty();
                option = "<option value=' '> ---- Select ---- </option>";
                for(var i=0; i<data.length; i++){
                    option = option + "<option value='"+data[i].productId + "'>"+data[i].productName + "</option>";
                }
                slctSubcat.append(option);
            },
            error:function(){
                alert("error");
            }

        });
    });

