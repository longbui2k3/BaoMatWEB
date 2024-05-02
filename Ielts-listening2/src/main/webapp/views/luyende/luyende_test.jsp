<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>
	<div id="test">
		<nav class="nav-test">
			<div class="container-xxl">
				<div class="row">
					<div class="col-3 d-flex justify-content-start">
						<a href='<c:url value="/user/luyen-de-home"></c:url>' class="btn-exit"> <i class="ti-angle-left me-1"></i>
							<h6>Trở về</h6>
						</a> 
					</div>
					<div class="col-6 d-flex justify-content-center">
						<div class="test-time">
							<i class="ti-alarm-clock me-2"></i>
							<h6 class="timer" valuenow="${currentTime}" valuemax="${endingTime}" enrollTestId="${enrollTest.enrrolId}">00 : 00 : 00</h6>
						</div>
						<h3 class="d-flex align-items-center">CAM 18 - TEST 2</h3>
					</div>
					<div class="col-3 d-flex justify-content-end">
						<a href="#" class="px-3 d-flex text-center align-items-center"><i
							class="ti-user"></i></a> <a href="#"
							class="px-3 d-flex text-center align-items-center"><i
							class="ti-book"></i></a>
					</div>
				</div>
			</div>
		</nav>
		<div class="container-xxl">
			<div class="row mt-3">
				<div class="col-3 d-flex">
					<i class="ti-headphone me-2"></i>
					<h6>Đề bài</h6>
				</div>
				<div class="col-6 d-flex">
					<i class="ti-microphone me-2"></i>
					<h6>Đề bài</h6>
				</div>
				<div class="col-3 d-flex">
					<i class="ti-bookmark-alt me-2"></i>
					<h6>Trả lời</h6>
				</div>
			</div>
			<div class="test-content row">
				<div class="col-3">
					<div class="audio-area">
						<div class="row">
							<div class="col d-flex align-items-center justify-content-start">
								<i class="prev10s-btn ti-arrow-circle-left"></i>
							</div>
							<div class="col d-flex justify-content-center">
								<div
									class="btn-toggle-play rounded-circle d-flex align-items-center justify-content-center">
									<i class="icon-play ti-control-play"></i> <i
										class="icon-pause ti-control-pause"></i>
								</div>
							</div>
							<div class="col d-flex align-items-center justify-content-end">
								<i class="next10s-btn ti-arrow-circle-right"></i>
							</div>
						</div>
						<input type="range" value="0"
							class="progress-time w-100 mt-3 h-2">
						<div class="mt-2 d-flex">
							<div
								class="text-start d-flex justify-content-start align-items-center">
								<span class="time-audio"> <span class="time-current">00:00:00</span><span
									class="time-separator"> / </span><span class="time-duration">00:00:00</span>
								</span>
							</div>
							<div
								class="col text-end d-flex justify-content-end align-items-center">
								<div class="volume me-2 d-flex align-items-center">
									<i class="ti-volume me-1"></i>
									<div class="volume-control">
										<input type="range" min="0" max="100" step="1" value="100"
											class="volume-range form-range"> <span
											class="volume-text"><span class="volume-text-value">100</span>%</span>
									</div>
								</div>
								<i class="setting ti-settings"></i>
							</div>
						</div>
						<c:choose>
							<c:when test="${currentPart.audio.substring(0,4)!='http'}">
								<audio class="audio">
									<source src='<c:url value="/image?fname=topicAudio/${currentPart.audio}"></c:url>' type="audio/mpeg">
								</audio>
							</c:when>
							<c:otherwise>
								<audio class="audio">
									<source src="${currentPart.audio}" type="audio/mpeg">
								</audio>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="question-area">
						<div class="d-flex">
							<i class="ti-layout-grid2 me-2"></i>
							<h6>Bảng câu hỏi</h6>
						</div>
						<div class="question-container">
							<div class="row">
								<div class="col d-flex justify-content-start">
									<i class="icon-answered"></i>
									<p>Đã trả lời</p>
								</div>
								<div class="col d-flex justify-content-end">
									<i class="icon-notAnswered"></i>
									<p>Chưa trả lời</p>
								</div>
							</div>
							<ul class="mt-4 d-flex flex-wrap justify-content-center">
								<c:set var="startNumber" value="${0}"></c:set>
								<c:forEach items="${enrollTest.mockTests.listeningParts}" var="listeningPart">
									<c:forEach items="${listeningPart.answerTests}" var="answerTest" varStatus="status">
										<c:set var="isCorrect" value="${false}" />
										<c:if test="${not empty isCompleted}">
											<c:forEach items="${enrollTest.answerUsers}" var="answerUser">
												<c:if test="${answerTest.answerId.equals(answerUser.answerTest.answerId) 
												and answerTest.answerKey.equals(answerUser.answer)}">
													<c:set var="isCorrect" value="${true}"/>
												</c:if>
											</c:forEach>
										</c:if>
										
										
										<c:set var="isAnswered" value="${false}" />
										<c:if test="${empty isCompleted}">
											<c:forEach items="${enrollTest.answerUsers}" var="answerUser">
												<c:if test="${answerUser.answerTest.answerId.equals(answerTest.answerId) 
												and (not empty answerUser.answer)}">
													<c:set var="isAnswered" value="${true}" />
												</c:if>
											</c:forEach>
										</c:if>
										
										<c:choose>
										    <c:when test="${empty isCompleted and isAnswered}">
										    	<li><a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${listeningPart.partId}"></c:url>'
										    	 class="number-question-item answered" enrollTestId="${enrollTest.enrrolId}"
										    	 answerTestId="${answerTest.answerId}">${startNumber + answerTest.number}</a></li>
										    </c:when>
										    <c:when test="${not empty isCompleted and isCorrect}">
										    	<li><a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${listeningPart.partId}"></c:url>'
										    	 class="number-question-item correct" enrollTestId="${enrollTest.enrrolId}"
										    	 answerTestId="${answerTest.answerId}">${startNumber + answerTest.number}</a></li>
										    </c:when>
										    <c:when test="${not empty isCompleted and not isCorrect}">
										    	<li><a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${listeningPart.partId}"></c:url>'
										    	 class="number-question-item incorrect" enrollTestId="${enrollTest.enrrolId}"
										    	 answerTestId="${answerTest.answerId}">${startNumber + answerTest.number}</a></li>
										    </c:when>
										    <c:otherwise>
										        <li><a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${listeningPart.partId}"></c:url>'
										         class="number-question-item" enrollTestId="${enrollTest.enrrolId}" 
										         answerTestId="${answerTest.answerId}">${startNumber + answerTest.number}</a></li>
										    </c:otherwise>
										</c:choose>
									</c:forEach>
									<c:set var="startNumber" value="${startNumber + listeningPart.answerTests.size()}"></c:set>
								</c:forEach>
                            </ul>
						</div>
					</div>
					<c:if test="${not empty isCompleted }">
						<div class="test-result-area">
							<div class="d-flex">
								<i class="ti-cup me-2"></i>
								<h6>Kết quả</h6>
							</div>
							<div class="dropdown mt-3">
							  <button type="button" class="btn btn-outline-primary dropdown-toggle w-100" data-bs-toggle="dropdown">
							    Lịch sử làm bài
							  </button>
							  
							  <ul class="dropdown-menu w-100">
							  	<c:forEach items="${listHistoryTest}" var="enrollTest">
							  		<li><a class="dropdown-item " href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId }"></c:url>'>
							  			Thời điểm: 
							  			<fmt:formatDate value="${enrollTest.enrrollmentDate}" pattern="hh:mm - dd/MM/yyyy"/>
							  			
							  			<span class="badge bg-primary rounded-pill float-end">${enrollTest.score}</span>
							  		</a>
							  		</li>
							  	</c:forEach>
							  </ul>
							</div>
							<div class="test-score mt-3">
								<div class="d-flex align-items-center">
									<img
										src="https://i.pinimg.com/originals/20/ba/a2/20baa2e5826f7c93e0f32203851bcabf.png"
										alt="">
									<div>
										<h3 class="test-score-value">${enrollTest.score}</h3>
										<span>${numberOfCorrectAnswers} đáp án đúng / ${numberOfQuestTion} câu hỏi</span>
									</div>
								</div>
							</div>
							<a href="#"
								class="a-btn mt-3 d-flex justify-content-center align-items-center">
								<h6>Quay về trang luyện đề</h6>
							</a> <a href="#"
								class="a-btn mt-3 d-flex justify-content-center align-items-center">
								<h6>Làm lại</h6>
							</a>
						</div>
					</c:if>
				</div>
				<div class="reading-session col-6">
					<div class="heading-container">
						<div class="row">
							<div class="col d-flex justify-content-start">
								<c:choose>
									<c:when test="${not empty prevPart}">
										<a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${prevPart}"></c:url>'
										 class="prev-part d-flex">
											<div class="icon me-2 d-flex align-items-center justify-content-center">
												<i class="ti-arrow-left"></i>
											</div>
											<h6>Phần trước</h6>
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" class="prev-part disabled d-flex">
											<div class="icon me-2 d-flex align-items-center justify-content-center">
												<i class="ti-arrow-left"></i>
											</div>
											<h6>Phần trước</h6>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col d-flex justify-content-center">
								<h6>PART</h6>
								<h6 class="part-number ms-2">${currentPart.number}</h6>
							</div>
							<div class="col d-flex justify-content-end">
								<c:choose>
									<c:when test="${not empty nextPart}">
										<a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${nextPart}"></c:url>' 
										class="next-part d-flex">
											<h6>Phần sau</h6>
											<div class="icon ms-2 d-flex align-items-center justify-content-center">
												<i class="ti-arrow-right"></i>
											</div>
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" class="next-part disabled d-flex">
											<h6>Phần sau</h6>
											<div class="icon ms-2 d-flex align-items-center justify-content-center">
												<i class="ti-arrow-right"></i>
											</div>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<%-- <div>
						<c:choose>
							<c:when test="${currentPart.image.substring(0,4)!='http'}">
								<img class="mt-3" src='<c:url value="/image?fname=imgMockTest/${currentPart.image}"></c:url>' alt="bai thi">
							</c:when>
							<c:otherwise>
								<img class="mt-3" src="${currentPart.image}" alt="bai thi">
							</c:otherwise>
						</c:choose>
					</div> --%>
					<div class='mt-2'>
						${currentPart.answerSheet}
					</div>
				</div>
				<div class="col-3">
					<ul class="answer-container">
						<c:set var="startNumber" value="${0}"></c:set>
						<c:forEach items="${enrollTest.mockTests.listeningParts}" var="listeningPart">
							<c:if test="${listeningPart.partId == currentPart.partId}">
								<c:forEach items="${listeningPart.answerTests}" var="answerTest">
									<c:set var="answer" value="" />
									<c:forEach items="${enrollTest.answerUsers}" var="answerUser">
										<c:if test="${answerUser.answerTest.answerId.equals(answerTest.answerId) 
											and (not empty answerUser.answer)}">
											<c:set var="answer" value="${answerUser.answer}" />
										</c:if>
									</c:forEach>
									
									<c:if test="${not empty isCompleted}">
										<c:choose>
											<c:when test="${not empty answer and answer.equals(answerTest.answerKey)}">
												<li class="answer-item correct d-flex">
													<span class="number-question d-flex justify-content-center align-items-center">${startNumber + answerTest.number}</span>
													<div class="col">
														<input class="answer-input" type="text" value="${answer}">
													</div>
												</li>
											</c:when>
											<c:otherwise>
												<li class="answer-item incorrect d-flex">
													<span class="number-question d-flex justify-content-center align-items-center">${startNumber + answerTest.number}</span>
													<div class="col">
														<input class="answer-input" type="text" value="${answer}"> 
														<span class="correct-answer">${answerTest.answerKey}</span>
													</div>
												</li>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${empty isCompleted}">
										<li class="answer-item d-flex">
											<span class="number-question d-flex justify-content-center align-items-center">${startNumber + answerTest.number}</span>
											<div class="col">
												<input class="answer-input not-completed" enrollTestId="${enrollTest.enrrolId}" answerTestId="${answerTest.answerId}" type="text" value="${answer}"> 
											</div>
										</li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:set var="startNumber" value="${startNumber + listeningPart.answerTests.size()}"></c:set>
						</c:forEach>
					</ul>
					<div class="text-center">
						<c:if test="${not empty nextPart}">
							<a href='<c:url value="/test/luyende_test?enrollTestId=${enrollTest.enrrolId}&currentPartId=${nextPart}"></c:url>'
							 class="d-flex btn-next-questions justify-content-center align-items-center">
								<h6>Phần kế tiếp</h6> 
							</a>
						</c:if>
						<c:if test="${(empty nextPart) and (empty isCompleted)}">
							<button type="button" class="btn-submit-test d-flex justify-content-center align-items-center"
							data-bs-toggle="modal" data-bs-target="#myModal">
								<h6>Nộp bài</h6>
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Xác nhận nộp bài</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
    
                <!-- Modal body -->
                <div class="modal-body overflow-auto">
                    Danh sách câu hỏi
                    <div class="spinner-border text-primary d-none"></div>
                    <ul class="list-group">
	                    <li class="list-group-item list-group-item-dark">Đã trả lời</li>
	    				<li class="list-group-item list-group-item-light">Chưa trả lời</li>
                    </ul>
    
                </div>
    
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Hủy</button>
                    <a href='<c:url value="/test/complete_test?enrollTestId=${enrollTest.enrrolId}"></c:url>'
                     class="btn btn-success">Xác nhận</a>
                </div>
            </div>
        </div>
    </div>
    <div id="my-toast"></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
        const testTimer = document.querySelector('.test-time .timer');
        const player = document.querySelector('.audio-area .btn-toggle-play');
        const audio = document.querySelector('.audio-area .audio');
        const progressTimeAudio = document.querySelector('.audio-area .progress-time');
        const audioTimer = document.querySelector('.audio-area .time-audio');
        const progressVolume = document.querySelector('.audio-area .volume-range');
        const volumeText = document.querySelector('.audio-area .volume-text-value');
        
        const enrollTestId = '${enrollTest.enrrolId}';
        

        var isPlaying = false;

        function convertSecondsToStringTime(seconds) {
            function addLeadingZero(number) {
                return number < 10 ? '0' + number : number;
            }
            var hourStr = Math.floor(seconds / 3600);
            var minuteStr = Math.floor((seconds % 3600) / 60);
            var secondStr = Math.floor(seconds % 60);
            return addLeadingZero(hourStr) + ":" + addLeadingZero(minuteStr) + ":" + addLeadingZero(secondStr);
        }

        //Xử lí khi audio đã tải thành công lên trình duyệt
        audio.addEventListener('loadedmetadata', function () {
            if (audio.duration) {
                audioTimer.querySelector('.time-duration').textContent =
                    convertSecondsToStringTime(audio.duration);
            }
        });
        
        function remindTimeTest({
        	title = '', 
            message = '', 
            type = 'info'}
        ){
        	toast({title: title, message: message, type: type, duration: 5000});
    		const clock = document.querySelector('#test .nav-test .test-time i');
    		clock.style.animation = 'rotate 0.5s ease infinite alternate, ripple 3s linear infinite';
    		setTimeout(()=>{
    			clock.style.animation = 'none';
            },20000)
        }

        function setTestTime() {
            var valueNow = parseInt(testTimer.getAttribute('valuenow'));
            var valueMax = parseInt(testTimer.getAttribute('valuemax'));
            if(valueMax)
            {
                if (valueNow < valueMax) {
                    valueNow += 1;
                    testTimer.setAttribute('valueNow', valueNow);
                    timeRemaining = valueMax - valueNow;
	            	if(timeRemaining == 5*60){
	            		remindTimeTest({title: "Chú ý", message: 'Bạn còn lại 5 phút', type: 'info'});
	            	}
	            	if(timeRemaining == 1*60){
	                    remindTimeTest({title: "Chú ý", message: 'Bạn còn lại 1 phút', type: 'warning'})
	            	}
                    var fomattedTime = convertSecondsToStringTime(timeRemaining);
                    testTimer.textContent = fomattedTime;
                }
                else {
                	const completeTestUrl = window.location.protocol + '//' + window.location.host + 
                	'/Ielts-listening2/test/complete_test?enrollTestId=' + enrollTestId;
                	//window.location.href = completeTestUrl;
                	window.location.replace(completeTestUrl);
                }
            }
        }

        //xử lí khi click btn play
        player.onclick = () => {
            if (isPlaying) {
                audio.pause();
            } else {
                audio.play();
            }
        }

        audio.onplay = () => {
            isPlaying = true;
            player.classList.add('playing');
        };
        audio.onpause = () => {
            isPlaying = false;
            player.classList.remove('playing');
        };

        //Xử lí khi thời gian của audio thay đổi
        audio.ontimeupdate = () => {
            if (audio.duration) {
                const progressPercent = Math.floor((audio.currentTime / audio.duration) * 100);
                progressTimeAudio.value = progressPercent;
                audioTimer.querySelector('.time-current').textContent = convertSecondsToStringTime(audio.currentTime);
            }
        };

        //Xử lí khi giá trị của progress bị đổi
        progressTimeAudio.onchange = function (e) {
            const seekTime = (audio.duration / 100) * e.target.value;
            audio.currentTime = seekTime;
            if(audio.duration) {
                audio.play();
            }
        };
        progressTimeAudio.addEventListener('input', (e) => {
            if (isPlaying) {
                audio.pause();
            }
            audioTimer.querySelector('.time-current').textContent = convertSecondsToStringTime((audio.duration / 100) * e.target.value) 
        });

        progressVolume.oninput = (e) => {
            var value = e.target.value;
            audio.volume = value/100;
            volumeText.textContent = value;
        }

        //với các thẻ input đã chứa class đúng sai thì chỉ được đọc chứ không được phép ghi
        const listAnswer = document.querySelectorAll('.answer-item.incorrect .answer-input,.answer-item.correct .answer-input');
        listAnswer.forEach((p) => {
            p.setAttribute('readonly', 'readonly');
        });
        
        
        //Xử lí api lưu trả lời tự động
        document.querySelectorAll('#test .answer-input.not-completed').forEach(input => {
            input.onblur = (e) => {
                const answerInput = e.target;
                const data = {
                		answerUserId: {
                			answerId: answerInput.getAttribute('answerTestId'),
                			enrrolId: answerInput.getAttribute('enrollTestId')
                		},
                		answer: answerInput.value
                }
                $.ajax({url: "/Ielts-listening2/api-luyende_test",
        			type: 'POST',
        			contentType: "application/json",
        			data:JSON.stringify(data),
                    success: function(enrollTest){
                   		const questionItem = document.querySelector('.question-container .number-question-item[answerTestId='+
                       		data['answerUserId']['answerId']+'][enrollTestId='+data['answerUserId']['enrrolId']+']');
                       	if (questionItem) {
                       		if (enrollTest['answer'] === ''){
                       			questionItem.classList.remove('answered');
                       		}
                       		else{
                       			questionItem.classList.add('answered');
                       		}
                       	}
                       	answerInput.value = enrollTest['answer'];
                    },
                    error:function(xhr){
                    	toast({title: 'Lỗi', message: 'Không thể lưu câu trả lời', type: 'error', duration: 3000});
                    }
                })
            };
       });
        
        const btnSubmit = document.querySelector('#test .btn-submit-test');
        if(btnSubmit){
        	btnSubmit.onclick = () => {
        		const spinner = document.querySelector('#myModal .modal-body .spinner-border');
        		spinner.classList.remove('d-none');
        		const modalBody = document.querySelector('#myModal .modal-body ul');
        		modalBody.innerHTML = '';
            	$.ajax({url: "/Ielts-listening2/api-comfirm-answers",
        			type: 'POST',
        			contentType: "application/json",
        			data:JSON.stringify({ enrrolId: enrollTestId}),
                    success: function(data){
                    	var strRender = data.reduce((total, item) => total.concat('<li class="list-group-item '+
                    			(item["DaTraLoi"]? 'list-group-item-light':'list-group-item-dark')+' ">Câu '+
                    			item["CauHoiSo"] + ': ' + (item["DaTraLoi"]? 'Đã trả lời':'Chưa trả lời') + '</li>'),'');
                    	const modalBody = document.querySelector('#myModal .modal-body ul');
                        modalBody.innerHTML = strRender;
                        spinner.classList.add('d-none');
                    },
                    error:function(xhr){
                    	toast({title: 'Lỗi', message: 'Không thể tải các câu trả lời', type: 'error', duration: 5000});
                    	spinner.classList.add('d-none');
                    	console.log(error);
                    }
                })
        	}
        }
        
        function toast({
            title = '', 
            message = '', 
            type = 'info', 
            duration = 3000
        }) {
            const myToast = document.getElementById('my-toast');
            const icons = {
                info: 'ti-info',
                warning: 'ti-face-sad',
                error:'ti-face-sad'
            };
            const icon = icons[type];
            if(myToast){
                const toast = document.createElement('div');

                const autoRemove = setTimeout(function(){
                    myToast.removeChild(toast);
                }, duration + 1000);

                toast.onclick = function(e) {
                    if(e.target.closest('.toast-close')){
                        myToast.removeChild(toast);
                        clearTimeout(autoRemove);
                    }
                }

                const delay = (duration / 1000).toFixed(2);
                toast.classList.add('my-toast','toast-' + type);
                toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s `+ delay +`s forwards`;
                toast.innerHTML = `<div class="toast-icon rounded-circle">
                                        <i class="` + icon + `"></i>
                                    </div>
                                    <div class="toast-body">
                                        <h6 class="toast-title">`+ title + `</h6>
                                        <p class="toast-msg">` + message + `</p>
                                    </div>
                                    <div class="toast-close">
                                        <i class="ti-close"></i>
                                    </div>
                                    <div class="my-border"></div>`;
                myToast.appendChild(toast);
            }
        }
        
        setTestTime()
        setInterval(setTestTime, 1000);
    </script>
</body>
</html>