<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/0b4621b427.js"
	crossorigin="anonymous"></script>

<title></title>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/nav.jsp"></jsp:include>
    <form class="container" method="post" action="<c:url value="/Admin/qna/Write.do"/>">
        <h2>어떤 문제를 겪고 계신가요?</h2>
        <!-- <select>
            <option></option>
        </select> -->
        <div class="box">
            <p>제목</p>
            <input type="text" id="title" name="title" placeholder="제목입력">
        </div>
        <div class="box">
            <p>문제에 대해서 정확한 내용을 적어주세요.</p>
            <div style="border: 1px solid rgba(206, 210, 218);">
                <textarea class="form-control" rows="10" name="story" placeholder=""></textarea>
            </div>
        </div>
        <div>
            
        </div>
        <div class="box">
            <p>사진 업로드<br/><small>첨부할 사진이 있다면 넣어주세요.</small></p>
            <!-- 여기 파일이름 -->
            <span>모시깽이.jpg</span><br/>
            <div class="imageContainer" style="display: flex; flex-wrap: wrap;">
                <button class="addImage" >추가</button>
                <input name="images" type="file" accept="image/*" class="image-upload" multiple>
            </div>
        </div>
        <button type="submit" class="sub_btn">확인</button>
    </form>
</body>
<script>
    function imageUpload(){//이미지 업로드해서 서버에넣고 파일 이름만 받아오기
        $.ajax({
            url: '<c:url value=""/>', // 컨트롤러 URL
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false
        }).done(function(data){
            console.log('업로드 성공')
            var image = $('.addImage').clone().find('i').remove();
            image.find('img').prop('src',data.getSrc);
            image.addClass('thum');
            image.insertAfter('.addImage:last');
        });
    }

    $('.addImage').click(function(){
        $('input[type=file]').trigger('click');
    });

    $('input[type=file]').change(function(){
        imageUpload();
    });
</script>
<style>
    textarea{
        width: 80%;
        height: 200px;
        font-size: 13px;
        padding: 5px;
        border: 0;
        /* border-bottom: 0.5px solid rgba(206, 210, 218, 0.596); */
        resize: none;
        outline: none;
        line-height: 1.15;
    }
    .image-upload {
        display: none;
    }
    #title, #tag{
        line-height: 1.15;
        overflow: visible;
        font-size: inherit;
        outline: none;
        border: 0;
        width: 100%;
        height: 20px;
        padding: 8px 0px;
        border-bottom: 0.5px solid rgb(206, 210, 218);
    }
    .container{
        margin: 40px;
    }
    .container .box:not(:nth-child(1)){
        margin-top: 40px
    }
    .addImage {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border: 1px gray solid; 
        width:60px;
        height:30px
    }
    .thum{
        width: 100%;
        height: 100%;
    }
    p{   
        font-size: 20px;
    }
    .sub_btn{
        margin-top: 20px;
        width: 200px;
        height: 60px;
        font-size: 25px;
        font-weight: 500;
        color: white;
        background-color: rgb(38,129,255);
        text-align: center;
        border: 0;
        border-radius: 10px;
        cursor: pointer;
        line-height: 60px;
    }
    
</style>
</html>