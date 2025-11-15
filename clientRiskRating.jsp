<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />
<title>User Risk Rate Update</title>
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
.drop-shadow {
	-webkit-box-shadow: 0 0 5px 2px rgba(0, 0, 0, .5);
	box-shadow: 0 0 5px 2px rgba(0, 0, 0, .1);
}

.modal-dialog, .modal-content #div_model_content {
	/* 80% of window height */
	height: 95%;
}

#div_model_content {
	height: 95%;
}

.modal-body {
	/* 100% = dialog height, 120px = header + footer */
	max-height: calc(100% - 10px);
}

.modal.modal-wide .modal-dialog {
	width: 95%;
}

.modal-mylarge {
	max-width: 95% !important;
}
</style>
<script>
	function cancel() {
		document.getElementById("Form1").reset();
		$('#table_id tbody').empty();
		loadClients();
		checkScreenAccess();
	}
	function showMessage() {
	}
</script>
<body onload="showMessage();">
	<div class="containerBlock" id="spin_container">
		<!-- loading sppiner -->
		<FORM NAME="Form1" METHOD="POST" id="Form1"
			action="UserCreationController">
			<INPUT TYPE="Hidden" NAME="Hid_scr_name" id="Hid_scr_name"
				VALUE="NEW"> <input type="hidden" name="requestAction"
				id="requestAction" value="userRoleOnload"> <INPUT
				TYPE="Hidden" NAME="Hid_numof_users" id="Hid_numof_users" VALUE="0">
			<TABLE WIDTH="100%" class="bg-light text-dark">
				<TR class="bg-light text-dark">
					<TD WIDTH="26%"></TD>
					<TD WIDTH="30%"><INPUT TYPE="Button"
						class="btn btn-sm btn-outline-primary" NAME="calcel_but"
						VALUE="Cancel" STYLE="" onClick="cancel()"> <INPUT
						TYPE="Button" class="btn btn-sm btn-outline-primary"
						NAME="Exit_but" VALUE=" &nbsp;&nbsp;Exit&nbsp;&nbsp;  " STYLE=""
						onClick="screen_close()"></TD>
					<TD id=change STYLE="{color: white ;font: bold 9pt Arial;text-align:right;}" WIDTH="44%" class="pull-right">
				 <ul class="breadcrumb ">
				  <li><i class="fa fa-home"></i> <a href="#">Home</a></li>
				  <li><a href="#">Client</a></li>				  
				  <li>Risk Rating Update</li>
				</ul> 
			</TD>		
				</TR>
			</TABLE>
			<div id="msgBox"></div>
			<!-- must include ajax alert -->
			<div id="confirmModelDiv"></div>
			<!-- must include confirm box -->
			<div class="container-fluid">
				<div class="row">
					<div class="col">&nbsp;</div>
				</div>
				<div class="row">
					<div class="col col-sm-11 col-md-11 col-lg-11 m-2">
						<table id="table_id" class="display table table-hover">
							<thead>
								<tr>
									<th scope="col" width="10%">Client Code</th>
									<th scope="col" width="25%">Name</th>
									<th scope="col" width="15%">Enter User</th>
									<th scope="col" width="15%">Enter Date</th>
									<th scope="col" width="15%">Mod User</th>
									<th scope="col" width="15%">Mod Date</th>
									<th scope="col" width="15%">Client Type</th>
									<th scope="col" width="10%" class="text-center">Process</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<!--row -->

				<div id="view_model"
					class="modal modal-wide fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-mylarge" style="max-width: auto;">
						<div class="modal-content" id="div_model_content">
							<div class="modal-header">
								<span>Client Risk Rating Details</span>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<iframe id="iframeClientDet" width="100%" height="100%"
									frameborder="0" data="dashboard.jsp"
									style="overflow: hidden; outline: none;"> </iframe>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- container-fluid -->
		</FORM>
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
	<!-- datepicker -->
	<script src="resources/plugins/datepicker/bootstrap-datepicker.min.js"></script>
	<!--loadingSpinner-->
	<script src="resources/plugins/waitme/waitMe.min.js"></script>

	<script type="text/javascript">
		function loadWaiting(stage) {
			if (stage == 'START') {
				$(document.body).waitMe({
					effect : 'bounce',
					bg : 'rgba(26, 209, 255, 0.2)',
					color : '#ffcc00'
				});
			} else {
				$(document.body).waitMe("hide");
			}
		}
		function loadWaitingSave(stage) {
			if (stage == 'START') {
				$(document.body).waitMe({
					effect : 'bounce',
					bg : 'rgba(26, 209, 255, 0.2)',
					color : '#ff6600'
				});
			} else {
				$(document.body).waitMe("hide");
			}
		}
		function checkScreenAccess() {
			$('#button_save').prop('disabled', true);
			var serverUrl = "UserScreenAccessController?requestAction=CHECK_ACCESS&screenName=CLIENT_APPROVAL";
			jsonCall(serverUrl, 'CHECK_ACCESS');
		}
		$(document).ready(function() {
			loadWaiting('START');
			checkScreenAccess();
			loadClients();
		});
		/* --------------------------- AJAX FUNCTIONS ------------------------------ */

		function loadClients() {
			var serverUrl = "ClientRiskRateController?requestAction=getPendingRiskClients&activeStatus=Y&riskStatus=N";
			jsonCall(serverUrl, 'getPendingUser');
		}

		function getJsonData(requestID, data, length) {
			if (requestID == 'CHECK_ACCESS') {
				console.log('CHECK_ACCESS ' + data.save);
				if (data.save == 'Y') {
					$('#button_save').prop('disabled', false);
				}
				if (data.view != 'V') {
					showMessageBox('WARNING', 'You don\'t have access!');
					setTimeout(function() {
						screen_close();
					}, 1000);

				}
			}
			if (requestID == 'getPendingUser') {

				if (length != 0) {
					var num = 0;
					var cType = "";
					for (var x = 0; x < length; x++) {
						if (data.jsonRespond[x].screenMode == 'NEW') {
							cType = "New";
						} else if (data.jsonRespond[x].screenMode == 'NIC') {
							cType = "NIC Change";
						}

						else {
							cType = "Existing";
						}

						var tr = '<tr>'
								+ '<td>'
								+ '<input type="hidden" id="hid_user_id_'+num+'" name="hid_client_id_'+num+'" value="'+data.jsonRespond[x].clientCode+'">'
								+ '<input type="hidden" id="hid_screen_'+num+'" name="hid_screen_'+num+'" value="'+data.jsonRespond[x].screenMode+'">'
								+ '<input type="hidden" id="hid_clientTpye_'+num+'" name="hid_clientTpye_'+num+'" value="'+data.jsonRespond[x].clientType+'">'
								+ data.jsonRespond[x].clientCode
								+ '</td>'
								+ '<td>'
								+ data.jsonRespond[x].clientName
								+ '</td>'
								+ '<td>'
								+ data.jsonRespond[x].entUser
								+ '</td>'
								+ '<td>'
								+ data.jsonRespond[x].entDateStr
								+ '</td>'
								+ '<td>'
								+ data.jsonRespond[x].modUser
								+ '</td>'
								+ '<td>'
								+ data.jsonRespond[x].modDateStr
								+ '</td>'
								+ '<td>'
								+ cType
								+ '</td>'
								+ '<td align="center" ><INPUT TYPE="Button" class="btn btn-sm btn-outline-primary" NAME="save_but" VALUE="Process" onClick="viewDetails(\''
								+ data.jsonRespond[x].clientCode
								+ '\',\''
								+ data.jsonRespond[x].entUser
								+ '\',\''
								+ data.jsonRespond[x].clientName
								//By Chathura Sankalpa on 15.10.2025
								+ '\',\''
								+ data.jsonRespond[x].clientType
								//
								+ '\')" align="center"></td>' +

								'</tr>'
						$("#table_id tbody").append(tr);
						num = num + 1;
					}
					$('#Hid_numof_users').val(num);
				}
			}
			setTimeout(function() {
				loadWaiting('STOP');
			}, 500);
			$("body").css("cursor", "default");
		}

		/* --------------------------- SCREEN FUNCTIONS ---------------------------- */
		function viewDetails(clientCode, entUser, clientName, clientType) {
			$('#view_model').modal('show');
			iframeClientDet.src = 'clientRiskRatingAuditLog.jsp?clientCode='
					+ clientCode + '&entUser=' + entUser + '&clientName='
					+ clientName +
					//By Chathura Sankalpa on 15.10.2025
 					'&clientType=' + clientType;
		}
	</script>
</body>
</html>