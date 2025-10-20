<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Academic Manager Page.aspx.cs" Inherits="UnamWebApplication.Academic_Manager_Page" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .manager-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .approvals-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .section-title {
            color: #2c3e50;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 25px;
            border-bottom: 3px solid #9b59b6;
            padding-bottom: 10px;
        }
        
        .btn-manager {
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 2px;
            cursor: pointer;
            font-size: 0.9rem;
            white-space: nowrap;
        }
        
        .btn-final-approve { background: #27ae60; color: white; }
        .btn-final-reject { background: #e74c3c; color: white; }
        .btn-export { background: #3498db; color: white; padding: 12px 24px; font-size: 1rem; }
        
        .btn-manager:hover {
            transform: translateY(-1px);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
        }
        
        .table-container {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-height: 600px;
            overflow: auto;
        }
        
        .table {
            width: 100%;
            margin-bottom: 0;
            table-layout: auto;
            min-width: 1200px;
        }
        
        .table th {
            background: linear-gradient(45deg, #9b59b6, #8e44ad);
            color: white;
            border: none;
            padding: 15px 12px;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
            white-space: nowrap;
            text-align: center;
        }
        
        .table td {
            padding: 12px;
            vertical-align: middle;
            border-color: #e9ecef;
            white-space: nowrap;
            text-align: center;
        }
        
        .action-cell {
            white-space: nowrap;
            position: sticky;
            right: 0;
            background: inherit;
            z-index: 5;
        }
        
        .status-badge {
            padding: 8px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .status-pending { background: #fff3cd; color: #856404; }
        .status-approved { background: #d4edda; color: #155724; }
        .status-rejected { background: #f8d7da; color: #721c24; }
        .status-recommended { background: #d1ecf1; color: #0c5460; }
        .status-notrecommended { background: #f5e6cc; color: #8a6d3b; }
        
        .btn-lecture {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            margin: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-lecture:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
            color: white;
            text-decoration: none;
        }
        
        .alert-message {
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            display: none;
            animation: slideIn 0.5s ease-out;
        }
        
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            opacity: 0.5;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .description-text {
            white-space: normal;
            word-wrap: break-word;
            max-width: 200px;
            margin: 0 auto;
            line-height: 1.4;
        }
        
        /* Professional scrollbar styling */
        .table-container::-webkit-scrollbar {
            width: 12px;
            height: 12px;
        }
        
        .table-container::-webkit-scrollbar-track {
            background: #f8f9fa;
            border-radius: 6px;
        }
        
        .table-container::-webkit-scrollbar-thumb {
            background: #9b59b6;
            border-radius: 6px;
            border: 2px solid #f8f9fa;
        }
        
        .table-container::-webkit-scrollbar-thumb:hover {
            background: #8e44ad;
        }
        
        .table-container::-webkit-scrollbar-corner {
            background: #f8f9fa;
        }
        
        /* Action buttons container */
        .action-buttons-container {
            display: flex;
            flex-wrap: nowrap;
            gap: 8px;
            justify-content: center;
        }
        
        /* Ensure table is fully visible with scroll */
        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }
    </style>

    <div class="manager-container">
        <!-- LED Welcome Banner -->
        <div class="led-container">
            <div class="led-welcome">💡 Welcome Academic Manager 💡</div>
        </div>

        <!-- Alert Messages -->
        <div id="alertMessage" class="alert-message"></div>

        <!-- Final Approvals Section -->
        <div class="approvals-section">
            <div class="section-header">
                <h3 class="section-title">Final Approval Queue</h3>
                <div class="action-buttons">
                    <button class="btn-manager btn-export" onclick="exportToExcel()">
                        📊 Export to Excel
                    </button>
                </div>
            </div>
            <div class="table-wrapper">
                <div class="table-container">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Claim ID</th>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Employee ID</th>
                                <th>Module Code</th>
                                <th>Programme</th>
                                <th>Date</th>
                                <th>Hours</th>
                                <th>Hourly Rate</th>
                                <th>Total Amount</th>
                                <th>Coordinator Recommendation</th>
                                <th>Description</th>
                                <th class="action-cell">Final Decision</th>
                            </tr>
                        </thead>
                        <tbody id="managerApprovalsBody">
                            <tr>
                                <td colspan="13" class="empty-state">
                                    <div>
                                        <i>📊</i>
                                        <h4>No Claims Available</h4>
                                        <p>There are no claims from Programme Coordinators at the moment.</p>
                                        <p>Claims with recommendations from Programme Coordinators will appear here automatically.</p>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <asp:HyperLink ID="btnBackManager" runat="server" Text="Back to Home" CssClass="btn-lecture" NavigateUrl="~/Default.aspx" />
            </div>
        </div>
    </div>

    <script>
        var managerClaims = JSON.parse(localStorage.getItem('managerClaims')) || [];
        var lecturerClaims = JSON.parse(localStorage.getItem('lecturerClaims')) || [];
        var coordinatorClaims = JSON.parse(localStorage.getItem('coordinatorClaims')) || [];

        function showAlert(message, type) {
            var alertDiv = document.getElementById('alertMessage');
            alertDiv.innerHTML = message;
            alertDiv.className = 'alert-message alert-' + type;
            alertDiv.style.display = 'block';

            setTimeout(function () {
                alertDiv.style.display = 'none';
            }, 12000); // 12 seconds
        }

        function updateManagerTable() {
            var tbody = document.getElementById('managerApprovalsBody');

            // Show ALL claims that have coordinator recommendations (both Recommended and Not Recommended)
            if (managerClaims.length === 0) {
                tbody.innerHTML = `
                    <tr>
                        <td colspan="13" class="empty-state">
                            <div>
                                <i>📊</i>
                                <h4>No Claims Available</h4>
                                <p>There are no claims from Programme Coordinators at the moment.</p>
                                <p>Claims with recommendations from Programme Coordinators will appear here automatically.</p>
                            </div>
                        </td>
                    </tr>
                `;
                return;
            }

            var html = '';
            managerClaims.forEach(function (claim) {
                // Determine coordinator recommendation status class
                var coordinatorClass = 'status-pending';
                if (claim.coordinatorRecommendation === 'Recommended') {
                    coordinatorClass = 'status-recommended';
                } else if (claim.coordinatorRecommendation === 'Not Recommended') {
                    coordinatorClass = 'status-notrecommended';
                }

                // Determine manager final status class
                var managerClass = 'status-pending';
                if (claim.managerFinalStatus === 'Approved') {
                    managerClass = 'status-approved';
                } else if (claim.managerFinalStatus === 'Rejected') {
                    managerClass = 'status-rejected';
                }

                // Action buttons - NO EDIT BUTTON
                var actionButtons = `
                    <div class="action-buttons-container">
                        <button class="btn-manager btn-final-approve" onclick="finalApprove('${claim.claimId}')">✅ Final Approve</button>
                        <button class="btn-manager btn-final-reject" onclick="finalReject('${claim.claimId}')">❌ Final Reject</button>
                    </div>
                `;

                html += `
                    <tr>
                        <td>${claim.claimId}</td>
                        <td>${claim.fullName}</td>
                        <td>${claim.surname}</td>
                        <td>${claim.employeeID}</td>
                        <td>${claim.moduleCode}</td>
                        <td>${claim.programme}</td>
                        <td>${claim.date}</td>
                        <td>${claim.hours}</td>
                        <td>R${claim.hourlyRate}</td>
                        <td>R${claim.totalAmount}</td>
                        <td><span class="status-badge ${coordinatorClass}">${claim.coordinatorRecommendation}</span></td>
                        <td>
                            <div class="description-text" title="${claim.description || 'No description provided'}">
                                ${claim.description || 'No description provided'}
                            </div>
                        </td>
                        <td class="action-cell">
                            ${actionButtons}
                        </td>
                    </tr>
                `;
            });

            tbody.innerHTML = html;
        }

        function finalApprove(claimId) {
            // Update manager claims
            managerClaims = managerClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.managerFinalStatus = 'Approved';
                }
                return claim;
            });
            localStorage.setItem('managerClaims', JSON.stringify(managerClaims));

            // Update lecturer claims
            lecturerClaims = lecturerClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.managerFinalStatus = 'Approved';
                }
                return claim;
            });
            localStorage.setItem('lecturerClaims', JSON.stringify(lecturerClaims));

            // Update coordinator claims
            coordinatorClaims = coordinatorClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.managerFinalStatus = 'Approved';
                }
                return claim;
            });
            localStorage.setItem('coordinatorClaims', JSON.stringify(coordinatorClaims));

            showAlert('Claim ' + claimId + ' has been finally approved! Payment processing initiated.', 'success');
            updateManagerTable();
        }

        function finalReject(claimId) {
            // Update manager claims
            managerClaims = managerClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.managerFinalStatus = 'Rejected';
                }
                return claim;
            });
            localStorage.setItem('managerClaims', JSON.stringify(managerClaims));

            // Update lecturer claims
            lecturerClaims = lecturerClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.managerFinalStatus = 'Rejected';
                }
                return claim;
            });
            localStorage.setItem('lecturerClaims', JSON.stringify(lecturerClaims));

            // Update coordinator claims
            coordinatorClaims = coordinatorClaims.map(claim => {
                if (claim.claimId === claimId) {
                    claim.managerFinalStatus = 'Rejected';
                }
                return claim;
            });
            localStorage.setItem('coordinatorClaims', JSON.stringify(coordinatorClaims));

            showAlert('Claim ' + claimId + ' has been finally rejected.', 'success');
            updateManagerTable();
        }

        function exportToExcel() {
            if (managerClaims.length === 0) {
                showAlert('No data available to export.', 'error');
                return;
            }

            // Create CSV content
            var csvContent = "Claim ID,Name,Surname,Employee ID,Module Code,Programme,Date,Hours,Hourly Rate,Total Amount,Coordinator Recommendation,Manager Final Status,Description\n";

            managerClaims.forEach(function (claim) {
                csvContent += `"${claim.claimId}","${claim.fullName}","${claim.surname}","${claim.employeeID}","${claim.moduleCode}","${claim.programme}","${claim.date}","${claim.hours}","R${claim.hourlyRate}","R${claim.totalAmount}","${claim.coordinatorRecommendation}","${claim.managerFinalStatus}","${claim.description.replace(/"/g, '""')}"\n`;
            });

            // Create and download file
            var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            var link = document.createElement("a");
            var url = URL.createObjectURL(blob);
            link.setAttribute("href", url);
            link.setAttribute("download", "manager_claims_" + new Date().toISOString().split('T')[0] + ".csv");
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            showAlert('Manager claims exported to Excel successfully!', 'success');
        }

        // Check for new claims every 2 seconds
        function checkForNewClaims() {
            var storedClaims = JSON.parse(localStorage.getItem('managerClaims')) || [];
            if (JSON.stringify(storedClaims) !== JSON.stringify(managerClaims)) {
                managerClaims = storedClaims;
                updateManagerTable();
            }
        }

        // Initialize
        window.onload = function () {
            updateManagerTable();
            setInterval(checkForNewClaims, 2000);
        }
    </script>
</asp:Content>