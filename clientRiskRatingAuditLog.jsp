<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
<title>User Risk Rating Audit Log</title>
<!-- bootstrap  -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/custom.css" />

<!-- Custom fonts  -->
<link href="resources/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Select2 -->
<link rel="stylesheet"
	href="resources/plugins/select2/css/select2.min.css">
<!-- dataTables.bootstrap -->
<link rel="stylesheet"
	href="resources/plugins/datatables/dataTables.bootstrap.css" />
<link rel="stylesheet"
	href="resources/plugins/datatables/jquery.dataTables.min.css" />
<!--  datepiceker -->
<link rel="stylesheet"
	href="resources/plugins/datepicker/bootstrap-datepicker3.min.css" />
<!--loadingspinner-->
<link rel="stylesheet" href="resources/plugins/waitme/waitMe.min.css">
</head>
<style>
.radio_spacing {
	margin-right: 80px;
}

.radio_spacing2 {
    margin-left: 0; /* Reset any left margin */
}
	
fieldset {
	margin-top: 30px;
	margin-bottom: 20px;
}
</style>
<script type="text/javascript">
	function showMessage(){}
</script>
<body onload="showMessage();">
	<div id="msgBox"></div>
	<div id="confirmModelDiv"></div>
	<!-- must include confirm box -->
	<!-- must include ajax alert -->
	<div class="containerBlock" id="spin_container">
		<!-- loading sppiner -->
		<div class="tab-pane" id="div_risk" role="tabpanel"
			aria-labelledby="risk-tab">
			<form name="form1" id="form1" method="POST"
				action="ClientRiskRateController">
				<input id="hiddenNoAml" type="hidden" />
				<input id="hiddenCaseId" type="hidden"  /> 
				<input id="hiddenUserId" type="hidden"  /> 
				<INPUT TYPE="Hidden"NAME="hid_select_client" id="hid_select_client" VALUE="">
				<div class="view_assign" id="div_ind_risk_report">
					<div
						class="col-sm-10 col-md-10 col-lg-11 ml-4 mt-4 card hovercard drop-shadow">
						<!-- Personal Details Fieldset Section -->
						<fieldset>
							<legend>Personal Details</legend>
							<section class="row">
								<label class="col col-lg-3 text-right">Client Name</label> <input
									type="text" id="text_ind_client_name"
									name="text_ind_client_name"
									class="d-inline form-control form-control-sm col-md-5 mb-1 col-lg-4"
									SIZE="30" MAXLENGTH="30" disabled>
							</section>
							<section class="row">
								<label class="col col-lg-3 text-right">NIC/PP/BR</label> <input
									type="text" id="text_ind_client_nic" name="text_ind_client_nic"
									class="d-inline form-control form-control-sm col-md-5 mb-1 col-lg-4"
									SIZE="30" MAXLENGTH="30" disabled>
							</section>
							<section class="row">
								<label class="col col-lg-3 text-right">Address</label> <input
									type="text" id="text_ind_client_adrs"
									name="text_ind_client_adrs"
									class="d-inline form-control form-control-sm col-md-5 mb-1 col-lg-4"
									SIZE="30" MAXLENGTH="30" disabled>
							</section>
							<section class="row">
								<label class="col col-lg-3 text-right">Client Type</label> <input
									type="text" id="text_ind_client_type"
									name="text_ind_client_type"
									class="d-inline form-control form-control-sm col-md-5 col-lg-4"
									SIZE="30" MAXLENGTH="30" disabled>
							</section>
						</fieldset>
						<!--Matching Table Section -->
						<fieldset>
							<legend>Matching Details</legend>
							<div class="col col-sm-11 col-md-11 col-lg-11 m-2">
								<table id="match_table_id" class="display table table-hover">
									<thead>
										<tr>
											<th scope="col" width="25%">Reference No</th>
											<th scope="col" width="10%">Name</th>
											<th scope="col" width="10%">List Type</th>
											<th scope="col" width="10%">Nationality</th>
											<th scope="col" width="10%">Percentage</th>
										</tr>
									</thead>
									<tbody id="tb-matchdetails">
									</tbody>
								</table>
							</div>
						</fieldset>
						<!-- Individual Client  Section -->
						<fieldset>
							<legend>Individual Client Data</legend>
							<section class="row">
								<div class="col-lg-3 text-left">
									<label>Risk Rating</label>
								</div>
								<div class="col-md-5 col-lg-4">
									<select id="Select_ind_risk_rating"
										name="Select_ind_risk_rating"
										class="form-control form-control-sm js-example-basic-single">
										<option value=""></option>
										<option value="L">Low</option>
										<option value="M">Medium</option>
										<option value="H">High</option>
									</select>
								</div>
							</section>

							<section class="row">
								<div class="col-lg-3 text-left">
									<label>Risk Comment</label>
								</div>
								<div class="col-md-5 col-lg-4">
									<textarea rows="3" id="text_ind_risk_comment" MAXLENGTH="200"
										name="text_ind_risk_comment" style="text-align: left;"
										class="form-control form-control-sm">
									</textarea>
								</div>
							</section>

							<section class="row">
							    <div class="col col-md-5 col-lg-4" style="margin-top: 15px;">
							        <div class="d-flex align-items-center gap-4"> 
							            <label class="radio_spacing me-3"> 
							                <input type="radio" name="option" value="Y"> Approve
							            </label> 
							            <label id="disapproveOption" class="radio_spacing2">
							                <input id="disapproveOptionRadio" type="radio" name="option" value="D">
							                Disapprove
							            </label>
							        </div>
							    </div>
							</section>
						</fieldset>
						<!--Matching Table Section -->
						<fieldset>
							<legend>Previous Risk Ratings</legend>
							<div class="col col-sm-11 col-md-11 col-lg-11 m-2">
								<table id="prev_table_id" class="display table table-hover">
									<thead>
										<tr>
											<th scope="col" width="25%">Entered User</th>
											<th scope="col" width="10%">Entered Date</th>
											<th scope="col" width="10%">Status</th>
											<th scope="col" width="10%">Risk Comment</th>
										</tr>
									</thead>
									<tbody id="tb-prevRisktRatngs">
									</tbody>
								</table>
							</div>
						</fieldset>
						<!-- Submit Button -->
						<div class="modal-footer">
							<button type="button" class="btn btn-sm btn-outline-secondary"
								data-dismiss="modal" onClick="cancelModel()">Cancel</button>

							<button type="button" class="btn btn-sm btn-outline-secondary"
								data-dismiss="modal" onClick="screen_close()">Close</button>
							<button type="submit" class="btn btn-sm btn-outline-primary"
								onClick="submitForm(event)" id="button_save">Submit</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/js/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>

	<!-- Select2 -->
	<script src="resources/plugins/select2/js/select2.full.min.js"></script>
	<!-- DataTables -->
	<script src="resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="resources/js/jsonCall.js"></script>
	<script src="resources/js/validate_input.js"></script>
	<!--loadingSpinner-->
	<script src="resources/plugins/waitme/waitMe.min.js"></script>
	<script>
		function showConfirmModel() {
		    var confirmHtml = '<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">' +
		                      '<div class="modal-dialog" role="document">' +
		                      '<div class="modal-content">' +
		                      '<div class="modal-header">' +
		                      '<h5 class="modal-title" id="confirmModalLabel">Confirmation</h5>' +
		                      '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
		                      '<span aria-hidden="true">&times;</span>' +
		                      '</button>' +
		                      '</div>' +
		                      '<div class="modal-body">' +
		                      'Are you sure you want to submit?' +
		                      '</div>' +
		                      '<div class="modal-footer">' +
		                      '<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>' +
		                      '<button type="button" class="btn btn-primary" onclick="processSubmit()">Submit</button>' +
		                      '</div>' +
		                      '</div>' +
		                      '</div>' +
		                      '</div>';
		    
		    $('#confirmModelDiv').html(confirmHtml);
		}
		function showConfirmAMLModel() {
		    var confirmHtml = '<div class="modal fade" id="confirmAMLModal" tabindex="-1" role="dialog" aria-labelledby="confirmAMLModalLabel" aria-hidden="true">' +
		                      '<div class="modal-dialog" role="document">' +
		                      '<div class="modal-content">' +
		                      '<div class="modal-header">' +
		                      '<h5 class="modal-title" id="confirmAMLModalLabel">AML Service Unavailable</h5>' +
		                      '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
		                      '<span aria-hidden="true">&times;</span>' +
		                      '</button>' +
		                      '</div>' +
		                      '<div class="modal-body">' +
		                      'AML service is currently unavailable. Do you want to continue without AML verification?' +
		                      '</div>' +
		                      '<div class="modal-footer">' +
		                      '<button type="button" class="btn btn-secondary" onclick="handleAMLNo()">No</button>' +
		                      '<button type="button" class="btn btn-primary" onclick="handleAMLYes()">Continue</button>' +
		                      '</div>' +
		                      '</div>' +
		                      '</div>' +
		                      '</div>';
		    
		    $('#confirmModelDiv').html(confirmHtml);
		    
		    $('#confirmAMLModal').modal('show');
		}

		function handleAMLNo() {
		    $('#confirmAMLModal').modal('hide');
		    screen_close();
		}

		function handleAMLYes() {
		    $('#confirmAMLModal').modal('hide');
		    $('#hiddenNoAml').val("Yes");
		    toggleElementVisibility("disapproveOption", true, "hiddenNoAml", "Yes");
		    
		    isAMLLoaded = true;
		    checkAndStopLoading();
		}
   		<!-- loadData -->
   		// Function to load waiting animation
        function loadWaitingSave(stage){
            if(stage == 'START'){
                $(document.body).waitMe({
                    effect : 'bounce',
                    bg : 'rgba(26, 209, 255, 0.2)',
                    color : '#ff6600'
                });
            }else{
                $(document.body).waitMe("hide");
            }
        }
   		
        function checkScreenAccess(){
           	$('#button_save').prop('disabled',true);
            var serverUrl = "UserScreenAccessController?requestAction=CHECK_ACCESS&screenName=CLIENT_RISK_RATING";
            jsonCall(serverUrl,'CHECK_ACCESS');
        }
        
        function getJsonData(requestID, data, length) {
            if(requestID == 'CHECK_ACCESS') {
                if(data.save != 'Y') {
                    showMessageBox('WARNING', 'You don\'t have save access!');
                }
                if(data.save == 'Y') {
                    $('#button_save').prop('disabled', false);
                }
                if(data.view != 'V') {
                    showMessageBox('WARNING', 'You don\'t have access!');
                    setTimeout(function() {
                        screen_close();
                    }, 1000);
                }
            }
        }
   		
        <!-- clientCode -->
        function getQueryParam(param) {
 	       const urlParams = new URLSearchParams(window.location.search);
 	       return urlParams.get(param);
 	   	}
        var globalStatus = null;
        
     
		var isAMLLoaded = false;
		var isPrevRatingsLoaded = false;
		
		function toggleElementVisibility(elementId, isVisible, hiddenFieldId, hiddenFieldValue) {
		    const element = document.getElementById(elementId);
		    const hiddenField = document.getElementById(hiddenFieldId);
		
		    if (isVisible) {
		        // Show the element and restore interactivity
		        element.style.display = "block";
		        element.removeAttribute("inert");
		        hiddenField.value = hiddenFieldValue || ""; 
		    } else {
		        // Hide the element and disable interactivity
		        element.style.display = "none";
		        element.setAttribute("inert", "");
		        hiddenField.value = hiddenFieldValue || "Yes"; 
		    }
		}
		
		
		function loadClient(){
		    const clientCode = getQueryParam('clientCode');
		    const entUser = getQueryParam('entUser');

		    window.clientCode = clientCode;
		    window.entUser = entUser;
		    
		    if(clientCode){
		        $.ajax({
		            url: 'ClientRiskRateController',
		            type: 'GET',
		            data: {
		                requestAction: 'getRiskRatingClient',
		                clientCode: clientCode
		            },
		            dataType: 'json', 
		            success: function(jsonResponse) {
		                try {
		                    if (jsonResponse.response === "1") {
		                        var jsonRespond = jsonResponse.jsonRespond;
		                        var addressString = jsonRespond.addIdentification + ", " + jsonRespond.addLocation + ", " + jsonRespond.addStreet + ", " + jsonRespond.addCity + " ," + jsonRespond.addCountry ;
		                        $('#text_ind_client_name').val(jsonRespond.clientName);
		                        $('#text_ind_client_nic').val(jsonRespond.nicNumber);
		                        //By Chathura on 16.10.2025
		                        $('#text_ind_client_adrs').val(addressString);
		                        var clientTypeLabel = (jsonRespond.clientType === "C") ? "Corporate" :
		                            				  (jsonRespond.clientType === "I") ? "Individual" :
		                                               jsonRespond.clientType; 

		      					$('#text_ind_client_type').val(clientTypeLabel);
		      					//
		                    } else {
		                        showMessageBox('WARNING !', 'Failed to retrieve client details');
		                    }
		                } catch (e) {
		                    showMessageBox('WARNING !', 'Failed to retrieve client details');
		                }
		                
		                isAMLLoaded = false;
		                isPrevRatingsLoaded = false;
		                
		                getAMLScreeningData();
		                getPrevRiskRating(clientCode);
		            },
		            error: function(xhr, status, error) {
		                loadWaitingSave('STOP'); 
		                showMessageBox('Error !', 'Failed to fetch client details');
		            }
		        });
		    }
		}

		function checkAndStopLoading() {
		    if (isAMLLoaded && isPrevRatingsLoaded) {
		        loadWaitingSave('STOP');
		    }
		}

		function getAMLScreeningData(){
		    const clientName = getQueryParam('clientName');
		    const clientType = getQueryParam('clientType');
		    
		    $('#tb-matchdetails').append('<tr><td colspan="5">Loading AML results...</td></tr>');

		    $.ajax({
		        url: 'ClientRiskRateController',
		        type: 'POST',
		        data: {
		            requestAction: 'getAMLScreeningResults',
		            clientName: clientName,
		            //By chathura sankalpa on 15.10.2025
		            clientType: clientType
		            //
		        },
		        dataType: 'json',
		        success: function(jsonResponse) {
		            $('#tb-matchdetails').empty();
		            var response = jsonResponse.response;
		            
		            try{
		                 if (response === "1") {
		                    $('#tb-matchdetails').empty();
		                    toggleElementVisibility("disapproveOption", true, "hiddenNoAml", "");
		                    
		                    var caseId = jsonResponse.caseId;
		                    var userId = jsonResponse.userId;
		                    
		                    $('#hiddenCaseId').val(caseId);
		                    $('#hiddenUserId').val(userId);
		                   
		                    var matchDetails = jsonResponse.jsonRespond;

		                    if (matchDetails && matchDetails.length > 0) {
		                        for (var x = 0; x < matchDetails.length; x++) {
		                            var row = '<tr>'+
		                           '<td>'+matchDetails[x].referenceNo+'</td>'+
		                           '<td>'+matchDetails[x].name+'</td>'+
		                           '<td>'+matchDetails[x].listType+'</td>'+
		                           '<td>'+matchDetails[x].nationality+'</td>'+
		                           '<td>'+matchDetails[x].percentage+'</td>'+
		                           '</tr>';
		                            $('#tb-matchdetails').append(row);
		                        }
		                    } else {
		                        $('#tb-matchdetails').append('<tr><td colspan="5">No matches found.</td></tr>');
		                    }
		                    
		                    isAMLLoaded = true;
		                    checkAndStopLoading();
		                    
		                } else if (response === "0") {
		                    toggleElementVisibility("disapproveOption", false, "hiddenNoAml", "Yes");
		                    var caseId = jsonResponse.caseId;
		                    var userId = jsonResponse.userId;
		                     
		                     $('#hiddenCaseId').val(caseId);
		                     $('#hiddenUserId').val(userId);
		                        
		                     $('#tb-matchdetails').append('<tr><td colspan="5">No matching AML results.</td></tr>');
		                     
		                     isAMLLoaded = true;
		                     checkAndStopLoading();
		                     
		                } else if (response === "3") {
		                    $('#tb-matchdetails').append('<tr><td colspan="5">AML service is currently unavailable. Please try again later.</td></tr>');
		                    
		                    isAMLLoaded = true;
		                    checkAndStopLoading();
		                    
		                    setTimeout(function() {
		                        showConfirmAMLModel();
		                    }, 100);
		                }
		            } catch (e){
		                console.error("AML Error:", e);
		                $('#tb-matchdetails').append('<tr><td colspan="5">Failed to fetch AML results</td></tr>');
		                
		                isAMLLoaded = true;
		                checkAndStopLoading();
		            }
		        },
		        error: function(xhr, status, error) {
		            $('#tb-matchdetails').append('<tr><td colspan="5">Connection Error! Failed to fetch AML results</td></tr>');
		            
		            isAMLLoaded = true;
		            checkAndStopLoading();
		        }
		    });
		}

		function getPrevRiskRating(clientCode){
		     $.ajax({
		        url: 'ClientRiskRateController',
		        type: 'GET',
		        data: {
		            requestAction: 'prevRiskDetails',
		            clientCode: clientCode
		        },
		        dataType: 'json',
		        success: function(jsonResponse) {
		            var response = jsonResponse.response;
		            
		            try{
		                if (response === "1") {
		                    $('#tb-prevRisktRatngs').empty();

		                    var prevRatings = jsonResponse.jsonRespond;
		                    if (prevRatings && prevRatings.length > 0) {
		                         for (var x = 0; x < prevRatings.length; x++) {
		                            globalStatus = prevRatings[x].status; 
		                            var row = '<tr>'+
		                            '<td>'+prevRatings[x].entUser+'</td>'+
		                            '<td>'+prevRatings[x].entDateStr+'</td>'+
		                            '<td>'+prevRatings[x].status+'</td>'+
		                            '<td>'+prevRatings[x].riskComment+'</td>'+
		                            '</tr>';
		                            $('#tb-prevRisktRatngs').append(row);
		                         }
		                    } else {
		                        $('#tb-prevRisktRatngs').append('<tr><td colspan="5">No previous risk ratings found.</td></tr>');
		                    }
		                } else {
		                    $('#tb-prevRisktRatngs').append('<tr><td colspan="5">No previous risk ratings found.</td></tr>');
		                }
		            }catch (e){
		                e.printStack();
		                $('#tb-prevRisktRatngs').append('<tr><td colspan="5"> Error ! Previous risk ratings error.</td></tr>');
		            }
		            
		            isPrevRatingsLoaded = true;
		            checkAndStopLoading();
		        },
		        error: function(xhr, status, error) {
		            $('#tb-prevRisktRatngs').append('<tr><td colspan="5">ERROR ! Failed to fetch previous risk ratings.</td></tr>');
		            
		            isPrevRatingsLoaded = true;
		            checkAndStopLoading();
		        }
		    });
		}
        
        $(document).ready(function(){
            loadWaitingSave('START');
            checkScreenAccess();
            loadClient();
            
            
            $('#text_ind_risk_comment').on('focus', function() {
                var value = $(this).val().trim();
                $(this).val(value);
                this.setSelectionRange(0, 0);
            });
            
            var textArea = $('#text_ind_risk_comment');
            textArea.val(textArea.val().trim());
            
        });
        
       <!-- formSubmission -->
       function submitForm(event) {
    	    <!--Prevent default form submission-->
    	    event.preventDefault();
    	    
    	    var riskRating = $('#Select_ind_risk_rating').val();
    	    var riskRatingComment = $('#text_ind_risk_comment').val().trim();
    	    var riskApprove = $('input[name="option"]:checked').val();
    	    
    	    var isValid = true;
    	    
    	    if(!riskRating) {
                showMessageBox('WARNING','Enter the Risk Rating!');
    	        isValid = false;
    	    }
    	    
    	    if(!riskRatingComment) {
                showMessageBox('WARNING','Enter the Risk Rating Comment!');
    	        isValid = false;
    	    }
    	    
    	    if(!riskApprove) {
                showMessageBox('WARNING','Select Approve Status !');
    	        isValid = false;
    	    }
    	    
    	    if(isValid) {
    	        loadWaitingSave('START');
                showConfirmModel();
                $('#confirmModal').modal('show');
    	        loadWaitingSave('STOP');

    	    }
       }
       
       function amlFeedBack() {
	   		try{
	   			var riskRatingComment = $('#text_ind_risk_comment').val().trim();
		   	    var riskApprove = $('input[name="option"]:checked').val();
		   	    var status = (riskApprove === "Y") ? "Approved" : "Disapproved";
		   	    
		   	 	var caseId = $("#hiddenCaseId").val();
		     	var userId = $("#hiddenUserId").val();
		
		   	    if (!userId || caseId.trim() === "") {
		   	        showMessageBox('WARNING', 'Server Connection Error !');
		   	        return;
		   	    }
		
		   	    var data = {
		   	        requestAction: 'submitCustomerApproval',
		   	        caseId: caseId,
		   	        dnStatus: status,
		   	        comment: riskRatingComment,
		   	        userId: userId
		   	    };
		
		   	    $.ajax({
		   	        url: 'ClientRiskRateController',
		   	        type: 'POST',
		   	        data: data,
		   	        dataType: 'json',
		   	        success: function(jsonResponse) {
		   	            loadWaitingSave('STOP');
		   	            var status = jsonResponse.status;
		   	            var message = jsonResponse.message;
						
		   	            if (status === "success") {
		   	             	postClientRiskDetails();
		   	            } else if (status === "Technical Issue") {
		   	                showMessageBox('WARNING', 'Server Technical Issue!');
		   	             	setTimeout(function() {
		                        screen_close(); // Close the modal
		                        window.location.href = 'clientRiskRating.jsp'; // Redirect to the desired page
		                    }, 2000); 
		   	            }
		   	        },
		   	        error: function(xhr, status, error) {
		   	            loadWaitingSave('STOP');
		   	            showMessageBox('WARNING', 'Failed to save data!');
		   	        }
	   	    	});
	   		}catch (e){
   	            showMessageBox('WARNING', 'Server Connection Error !');
	   		}   	    
   		}
       
       function postClientRiskDetails(){
    	   
    	   try{
               	const cType = getQueryParam('cType');

	    		var clientCode = window.clientCode;
	   	   		var entUser = window.entUser;
	   	   	    var riskRating = $('#Select_ind_risk_rating').val();
	   	   	    var riskRatingComment = $('#text_ind_risk_comment').val().trim();
	   	   	    var riskApprove = $('input[name="option"]:checked').val();
		   	    var status = (riskApprove === "Y") ? "Approved" : "Disapproved";
	
		   	   	$.ajax({
		            url: 'ClientRiskRateController',
		            type: 'POST',
		            data: {
		                requestAction: 'postClientRiskDetails',
		                clientCode: clientCode,
		                riskRating: riskRating,
		                riskRatingComment: riskRatingComment,
		                riskApprove: riskApprove,
		                cType: cType 
		            },
		            dataType: 'json',
		            success: function(jsonResponse) {
						
		         	var status = jsonResponse.status;
		         	var message = jsonResponse.message;
		                loadWaitingSave('STOP');
		                if (status === 'success') {
		                    saveLog(clientCode, riskRating, riskRatingComment, riskApprove, entUser);
		                } else {
		                    showMessageBox('WARNING', message);
		                }
		            },
		            error: function(xhr, status, error) {
		                loadWaitingSave('STOP');
		                showMessageBox('WARNING','Failed to submit risk rating Please Try again!');
		            }
		        });
    	   }catch (e){
  	            showMessageBox('WARNING', 'Client Risk Rating Update Error !');
    	   }	 
       }
       
       function processSubmit(){
			
    	    $('#confirmModal').modal('hide');
    	    loadWaitingSave('START');
    	    
    	    const amlStatus = $('#hiddenNoAml').val();;  
    	    console.log(amlStatus);
    	    if(amlStatus === 'Yes'){
    	    	postClientRiskDetails();
				$('#hiddenNoAml').val("No");

    	    }else{
    			amlFeedBack();

    	    }
    	        
    	}
       
       function saveLog(clientCode, riskRating, riskRatingComment, riskApprove, entUser) {
			try{
				 loadWaitingSave('START');
			   	    $.ajax({
			   	        url: 'ClientRiskRateController',
			   	        type: 'POST',

			   	        data: {
			   	            requestAction: 'saveLog',
			   	            clientCode: clientCode,
			   	            riskRating: riskRating,
			   	            riskRatingComment: riskRatingComment,
			   	            status: riskApprove,
			   	            entUser: entUser,
			   	            entDate: null,
			   	        },
			   	        dataType: 'json',
			   	        success: function(jsonResponse) {
			   	        	var status = jsonResponse.status;
			               	var message = jsonResponse.message;
			   	            loadWaitingSave('STOP');
			   	         if (status === "success") {
					   	        showMessageBox('SAVE_SUCCESS', 'Data Saved Successfully!');
						   		loadWaitingSave('START');
					   	        setTimeout(function() {
					                     screen_close();
										}, 3000); 
								setTimeout(function () {
								    // Redirect to clientRiskRating.jsp
								    window.parent.location.href = 'clientRiskRating.jsp?reload=true';
									}, 2500);
			   	            } else {
			   	                showMessageBox('WARNING',message);
			   	            }
			   	        },
			   	        error: function(xhr, status, error) {
			   	            loadWaitingSave('STOP');
				            showMessageBox('WARNING','Failed to save log');
			   	        }
			   	    });
			} catch(e){
                showMessageBox('WARNING','Log saving error !');

			}
   	   
   	}
    	

    	function resetForm() {
    	    $('#Select_ind_risk_rating').val('').trigger('change');
    	    $('#text_ind_risk_comment').val('');
    	    $('input[name="option"]').prop('checked', false);

    	}
    	
    	function screen_close(){
    		<!--close iframe-->
    		if (window.parent) {
    	        try {
    	            window.parent.$('#view_model').modal('hide');
    	        } catch(e) {
    	            console.error("Error closing parent modal:", e);
    	        }
    		}
  
    	}
    	
    	 function cancelModel(){
             $('#hid_select_client').val('');
             resetForm();
         }

</script>
</body>
</html>