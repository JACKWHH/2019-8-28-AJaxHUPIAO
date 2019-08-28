<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
        $(function(){//页面加载完成就会执行此代码
            setInterval(quoto,0);//每隔5秒钟执行quoto函数
        });
        function quoto(){//该函数通过调用ajax对象（AMLHttpRequest）向服务器发送异步请求，服务器返回一个描述股票信息的字符串，通过解析json字符串，获得股票信息，然后更新表格
            $.ajax({//利用jQuery提供的方法向服务器发送异步请求
                "url":"quoto.do",
                "type":"post",
                "dataType":"json",
                "success":function(stocks){
                    //$.ajax会自动将json字符串转换成JavaScript对象
                    //清空tbody
                    $('#tb1').empty();
                    for(i=0;i<stocks.length;i++){
                        var s=stocks[i];
                        //更新表格
                        $('#tb1').append('<tr><td>'+s.code+'</td><td>'+s.name+'</td><td>'+s.price+'</td></tr>');

                    }
                }
            });
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <style type="text/css">
        #d1{
            width:450px;
            height:350px;
            background-color:black;
            margin-left:300px;
            margin-top:20px;
        }
        #d2{
            height:40px;
            background-color:red;
            color:yellow;
        }
        table{
            color:white;
            font-style:italic;
            font-size:24px;
        }
    </style>
</head>
<body style="font-size:30px;">
<div id="d1">
    <div id="d2">股票行情</div>
    <div id="d3">
        <table width="100%">
            <thead>
            <tr>
                <td>代码</td>
                <td>名称</td>
                <td>价格</td>
            </tr>
            </thead>
            <tbody id="tb1">

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
